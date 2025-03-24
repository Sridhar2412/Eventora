import 'package:dio/dio.dart';
import 'package:flutter_master/domain/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/constants.dart';
import '../../../domain/model/token.dart';
import '../../helper/dio_instance.dart';

// import '../../model/otp_req.dart';
// import '../../model/send_otp_res.dart';
// import '../../model/verify_otp_res.dart';

part 'auth_source.g.dart';

@riverpod
AuthSource authSource(AuthSourceRef ref) =>
    AuthSource(ref.watch(dioInstanceProvider));

@RestApi()
abstract class AuthSource {
  factory AuthSource(Dio dio) => _AuthSource(dio);

  @POST(Constants.generateToken)
  Future<Token> generateToken(@Body() Map<String, dynamic> body);

  @POST(Constants.saveUser)
  Future<User> saveUser(@Body() Map<String, dynamic> body);

  @POST(Constants.refreshToken)
  Future<Token> refreshToken(@Body() Map<String, String> body);

  @POST(Constants.login)
  Future<Token> login(@Body() Map<String, String> body);

  // @POST(Constants.sendOtp)
  // Future<SendOtpRes> sendOtp(@Body() OtpReq body);

  // @POST(Constants.verifyOtp)
  // Future<VerifyOtpRes> verifyOtp(@Body() Map<String, dynamic> body);
}
