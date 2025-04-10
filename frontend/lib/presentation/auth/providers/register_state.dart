import 'package:api/api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../../data/model/send_otp_res.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String error,
    @Default('') String otpError,
    @Default(false) bool loading,
    @Default(false) bool resendOtp,
    CreateUserRequestRoleEnum? userRole,
    // @Default(SendOtpRes()) SendOtpRes otp,
    @Default({}) Map<int, String> otpMap,
  }) = _RegisterState;
}
