import 'package:dartz/dartz.dart';
import 'package:flutter_master/core/exception/app_exception.dart';
import 'package:flutter_master/domain/model/user.dart';
import 'package:flutter_master/domain/repository/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/extension/future.dart';
import '../../domain/model/token.dart';
import '../source/remote/auth_source.dart';

part 'auth_repo_impl.g.dart';

@riverpod
AuthRepository authRepo(AuthRepoRef ref) =>
    AuthRepositoryImpl(ref.read(authSourceProvider));

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._source);

  final AuthSource _source;

  @override
  Future<Either<AppException, Token>> generateToken(
    String username,
    String password,
  ) {
    final token = {
      'username': username,
      'password': password,
      // 'isAdminLogin': false,
    };
    return _source.generateToken(token).guardFuture();
  }

  @override
  Future<Either<AppException, Token>> refreshToken(String token) {
    return _source.refreshToken({'refreshToken': token}).guardFuture();
  }

  // @override
  // Future<Either<AppException, SendOtpRes>> sendOtp(OtpReq req) {
  //   return _source.sendOtp(req.copyWith(roles: ['ROLE_CLIENT'])).guardFuture();
  // }

  // @override
  // Future<Either<AppException, VerifyOtpRes>> verifyOtp(
  //   String username,
  //   String otp,
  // ) {
  //   final body = {
  //     'username': username,
  //     'otp': otp,
  //   };
  //   return _source.verifyOtp(body).guardFuture();
  // }

  @override
  Future<Either<AppException, User>> saveUser(
    String fullName,
    String email,
    String phone,
    String password,
  ) {
    final body = {
      'name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
    };
    return _source.saveUser(body).guardFuture();
  }

  @override
  Future<Either<AppException, Token>> login(String email, String password) {
    final body = {
      'email': email,
      'password': password,
    };
    return _source.login(body).guardFuture();
  }
}
