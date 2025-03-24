// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// import '../exception/app_exception.dart';

// extension FutureExtension on Future {
//   Future<Either<AppException, T>> guardFuture<T>() async {
//     try {
//       final T res = await (this as Future<T>);
//       return right(res);
//     } on Exception catch (e) {
//       AppException? error =
//           AppException(type: ErrorType.other, message: 'Something went wrong!');
//       if (e is DioError && e.error is AppException) {
//         error = e.error as AppException?;
//       }
//       return left(error ?? AppException(type: ErrorType.other, message: ''));
//     }
//   }
// }

// extension FutureEitherExtension<T> on Future<Either<AppException, T>> {
//   Future<T> getResultOrNull({Function(AppException error)? onError}) async {
//     late T result;
//     (await this).fold((error) {
//       onError?.call(error);
//     }, (data) {
//       result = data;
//     });
//     return result;
//   }
// }

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_master/core/exception/app_exception.dart';
import 'package:flutter_master/core/extension/log.dart';

extension FutureExtension on Future {
  Future<T> guard<T>() async {
    try {
      final res = await this;
      if (res is Response<T> && res.data is T) {
        return res.data as T;
      }
      return res as T;
    } on DioException catch (e, _) {
      e.logError();

      // Check if the response data is of the expected error format
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response?.data as Map<String, dynamic>;

        // Check for 'status' and 'error' fields in the response
        if (errorData['status'] == 'ERROR' &&
            errorData['error'] is Map<String, dynamic>) {
          final errorMessage = errorData['error']['message'] ?? 'Unknown error';
          final errorCode = errorData['code'] ?? 400;

          // Log the error message cleanly
          print('API Error [Code: $errorCode]: $errorMessage');

          // Return a custom AppException with the message and code
          return Future.error(
            AppException(
              message: errorMessage,
              type: ErrorType.response,
              data: {
                'status': errorData['status'],
                'code': errorCode,
                'error': errorData['error'],
              },
            ),
          );
        }
      }

      // Handle no internet connection (SocketException)
      if (e.error is SocketException) {
        return Future.error(
          AppException(
            message: 'No Internet Connection',
            type: ErrorType.connection,
          ),
        );
      }

      // Handle other DioException cases
      print('Dio Exception: ${e.message}'); // Log the message of DioException
      return Future.error(
        AppException(
          message:
              kDebugMode ? 'Unhandled Dio Exception' : 'Something went wrong!',
          type: ErrorType.other,
        ),
      );
    } on FirebaseException catch (e, _) {
      e.logError();
      final error = switch (e.code) {
        'invalid-verification-code' => AppException(
            message: 'Invalid OTP',
            type: ErrorType.phoneLinkFirebase,
          ),
        'credential-already-in-use' => AppException(
            message: e.message ?? '',
            type: ErrorType.phoneLinkFirebase,
          ),
        _ => AppException(message: e.message ?? '', type: ErrorType.other)
      };
      return Future.error(error);
    } on Exception catch (e, stack) {
      e.logError();
      '$e\n$stack'.logError();

      // Log the error cleanly without printing the whole stack trace
      print('Unhandled Exception: $e');

      return Future.error(
        AppException(
          message: kDebugMode ? 'Unhandled Exception' : 'Something went wrong!',
          type: ErrorType.other,
        ),
      );
    }
  }

  Future<Either<AppException, T>> guardFuture<T>() async {
    try {
      final T res = await (this as Future<T>);
      return right(res);
    } on Exception catch (e) {
      AppException? error =
          AppException(type: ErrorType.other, message: 'Something went wrong!');
      if (e is DioException && e.error is AppException) {
        error = e.error as AppException?;
      }
      return left(error ?? AppException(type: ErrorType.other, message: ''));
    }
  }
}
