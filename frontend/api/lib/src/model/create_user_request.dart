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
    this.dob,
    this.role,
    this.organization,
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

  @JsonKey(
    name: r'dob',
    required: false,
    includeIfNull: false,
  )
  DateTime? dob;

  @JsonKey(
    name: r'role',
    required: false,
    includeIfNull: false,
  )
  CreateUserRequestRoleEnum? role;

  @JsonKey(
    name: r'organization',
    required: false,
    includeIfNull: false,
  )
  String? organization;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateUserRequest &&
          other.fullname == fullname &&
          other.email == email &&
          other.mobile == mobile &&
          other.password == password &&
          other.dob == dob &&
          other.role == role &&
          other.organization == organization;

  @override
  int get hashCode =>
      fullname.hashCode +
      email.hashCode +
      mobile.hashCode +
      password.hashCode +
      dob.hashCode +
      role.hashCode +
      organization.hashCode;

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum CreateUserRequestRoleEnum {
  @JsonValue(r'ADMIN')
  ADMIN(r'ADMIN'),
  @JsonValue(r'ORGANIZER')
  ORGANIZER(r'ORGANIZER'),
  @JsonValue(r'USER')
  USER(r'USER');

  const CreateUserRequestRoleEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
