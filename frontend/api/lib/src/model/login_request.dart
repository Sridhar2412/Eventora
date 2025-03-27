//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginRequest {
  /// Returns a new [LoginRequest] instance.
  LoginRequest({
    this.email,
    this.password,
  });

  @JsonKey(
    name: r'email',
    required: false,
    includeIfNull: false,
  )
  String? email;

  @JsonKey(
    name: r'password',
    required: false,
    includeIfNull: false,
  )
  String? password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginRequest &&
          other.email == email &&
          other.password == password;

  @override
  int get hashCode => email.hashCode + password.hashCode;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
