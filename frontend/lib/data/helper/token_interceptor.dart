import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_master/core/extension/log.dart';
import 'package:flutter_master/core/providers/token_provider.dart';
import 'package:flutter_master/data/helper/api_client.dart';
import 'package:flutter_master/data/source/local/shar_pref.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/providers/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenInterceptorsWrapper extends QueuedInterceptorsWrapper {
  TokenInterceptorsWrapper(this._ref);
  final Ref _ref;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Check for session & token expiry
    final api = _ref.read(apiProvider).getAuthApi();

    // Handle 401 (unauthenticated) response
    if (err.response?.statusCode != 401 || err.response?.data is! Map) {
      return handler.next(err);
    }

    // Extract message from the response
    final {'message': String? message} =
        err.response?.data as Map<String, dynamic>;

    // Read the current token
    final token = _ref.read(tokenNotifierProvider);

    // if (message == 'TOKEN_EXPIRED') {
    //   // Refresh token if expired
    //   final result = await api
    //       .refreshesToken(
    //         payload: AuthRequest(refreshToken: token.refreshToken ?? ''),
    //       )
    //       .guard<AuthResponse>();

    //   print('Token refreshed: $result');

    //   // Update the token in the provider
    //   await _ref.read(tokenNotifierProvider.notifier).updateToken(result.tokens);

    //   // Retry the failed request with the new token
    //   try {
    //     final dio = Dio();
    //     final newToken = _ref.read(tokenNotifierProvider);

    //     // Add interceptors to the new Dio instance
    //     dio.interceptors.addAll([if (kDebugMode) LogInterceptor()]);

    //     final res = await dio.fetch(
    //       err.requestOptions.copyWith(
    //         headers: {
    //           ...err.requestOptions.headers,
    //           'Authorization': 'Bearer ${newToken.accessToken}',
    //         },
    //       ),
    //     );
    //     handler.resolve(res);
    //   } on DioException catch (e) {
    //     return handler.reject(e);
    //   }
    // } else
    if (message == 'SESSION_EXPIRED') {
      // Handle session expiration (log out user)
      'SESSION_EXPIRED'.logError();
      await _ref.read(sharedPrefProvider).clearAll();
      unawaited(_ref.read(routerProvider).replaceAll([const LoginRoute()]));
      return;
    }

    // Continue with the error handling chain
    return handler.next(err);
  } 

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Ensure the latest token is added to request headers
    final token = _ref.read(tokenNotifierProvider);
    if (token.accessToken != '') {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
