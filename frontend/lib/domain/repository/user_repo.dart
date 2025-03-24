import 'package:dartz/dartz.dart';
import 'package:flutter_master/core/exception/app_exception.dart';

import '../model/user.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> getUser();
  Future<Either<AppException, User>> getUserById(int id);
  Future<Either<AppException, List<User>>> getUserList();
}
