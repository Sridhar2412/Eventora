//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'api_users_login_post_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ApiUsersLoginPostRequest {
  /// Returns a new [ApiUsersLoginPostRequest] instance.
  ApiUsersLoginPostRequest({
    required this.email,
    required this.password,
  });

  @JsonKey(
    name: r'email',
    required: true,
    includeIfNull: false,
  )
  String email;

  @JsonKey(
    name: r'password',
    required: true,
    includeIfNull: false,
  )
  String password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiUsersLoginPostRequest &&
          other.email == email &&
          other.password == password;

  @override
  int get hashCode => email.hashCode + password.hashCode;

  factory ApiUsersLoginPostRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiUsersLoginPostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUsersLoginPostRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
