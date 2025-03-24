import 'package:dartz/dartz.dart';
import 'package:flutter_master/core/exception/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/extension/future.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/user_repo.dart';
import '../source/remote/user_source.dart';

part 'user_repo.g.dart';

@riverpod
UserRepository userRepo(UserRepoRef ref) {
  return UserRepositoryImpl(ref.watch(userSourceProvider));
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._source);

  final UserSource _source;

  @override
  Future<Either<AppException, User>> getUserById(int id) {
    return _source.getUserById(id).guardFuture();
  }

  @override
  Future<Either<AppException, List<User>>> getUserList() {
    return _source.getUserList().guardFuture();
  }

  @override
  Future<Either<AppException, User>> getUser() {
    return _source.getUser().guardFuture();
  }
}
