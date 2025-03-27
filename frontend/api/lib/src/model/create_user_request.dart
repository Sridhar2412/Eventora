//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateUserRequest {
  /// Returns a new [CreateUserRequest] instance.
  CreateUserRequest({
    this.fullname,
    this.email,
    this.mobile,
    this.password,
  });

  @JsonKey(
    name: r'fullname',
    required: false,
    includeIfNull: false,
  )
  String? fullname;

  @JsonKey(
    name: r'email',
    required: false,
    includeIfNull: false,
  )
  String? email;

  @JsonKey(
    name: r'mobile',
    required: false,
    includeIfNull: false,
  )
  String? mobile;

  @JsonKey(
    name: r'password',
    required: false,
    includeIfNull: false,
  )
  String? password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateUserRequest &&
          other.fullname == fullname &&
          other.email == email &&
          other.mobile == mobile &&
          other.password == password;

  @override
  int get hashCode =>
      fullname.hashCode + email.hashCode + mobile.hashCode + password.hashCode;

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
