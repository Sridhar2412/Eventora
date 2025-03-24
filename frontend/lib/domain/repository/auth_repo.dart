import 'package:dartz/dartz.dart';
import 'package:flutter_master/core/exception/app_exception.dart';
import 'package:flutter_master/domain/model/user.dart';

// import '../../data/model/otp_req.dart';
// import '../../data/model/send_otp_res.dart';
// import '../../data/model/verify_otp_res.dart';
import '../model/token.dart';

abstract class AuthRepository {
  Future<Either<AppException, Token>> generateToken(
    String username,
    String password,
  );

  Future<Either<AppException, User>> saveUser(
    String fullName,
    String email,
    String phone,
    String password,
  );
  Future<Either<AppException, Token>> login(
    String email,
    String password,
  );
  Future<Either<AppException, Token>> refreshToken(String token);

  // Future<Either<AppException, SendOtpRes>> sendOtp(OtpReq req);

  // Future<Either<AppException, VerifyOtpRes>> verifyOtp(
  //   String username,
  //   String otp,
  // );
}
