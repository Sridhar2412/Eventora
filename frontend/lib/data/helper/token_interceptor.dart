import 'package:dio/dio.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/extension/log.dart';
import '../../core/providers/token_provider.dart';
import '../../core/utils/app_utils.dart';
import '../../presentation/shared/providers/router.dart';
import '../model/api_res.dart';
import '../repository/auth_repo_impl.dart';
import '../source/local/shar_pref.dart';
import 'error_interceptor.dart';
import 'log_interceptor.dart';

class TokenInterceptorsWrapper extends QueuedInterceptorsWrapper {
  TokenInterceptorsWrapper(this._ref);
  final Ref _ref;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    //Check unauthenticated
    if (err.response?.statusCode == 401) {
      final res = ApiRes.fromJson(err.response?.data);
      if (res.error?.type == 'TOKEN_EXPIRED') {
        'TOKEN_EXPIRED'.logError();
        final result = await _ref.read(authRepoProvider).refreshToken(''
            // _ref.read(
            // tokenNotifierProvider.select((value) => value.refreshToken),
            // ),
            );
        'TOKEN_EXPIREDaas'.logError();

        result.fold((error) {
          return handler.reject(err);
        }, (result) async {
          await _ref.read(tokenNotifierProvider.notifier).updateToken(result);
          final tempHeader = err.requestOptions.headers;
          tempHeader['authorization'] = 'Bearer ${result.accessToken}';
          try {
            final dio = Dio();
            dio.interceptors.addAll([
              LogInterceptorsWrapper(),
              ErrorInterceptorsWrapper(),
            ]);
            final res = await dio.request(
              '${err.requestOptions.baseUrl}${err.requestOptions.path}',
              data: err.requestOptions.data,
              options: Options(
                method: err.requestOptions.method,
                headers: tempHeader,
              ),
            );
            AppUtils.checkError(res.data, res.requestOptions).fold(
              (error) {
                return handler.reject(error);
              },
              (response) {
                res.data = AppUtils.convertDataToMap(response);
                return handler.resolve(res);
              },
            );
          } on DioException catch (e) {
            return handler.reject(e);
          }
        });
      } else if (res.error?.type == 'SESSION_EXPIRED') {
        'SESSION_EXPIRED'.logError();
        await _ref.read(sharedPrefProvider).clearAll();
        _ref.read(routerProvider).replaceAll([const LoginRoute()]);
      }
    } else {
      return handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handler.next(options);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
