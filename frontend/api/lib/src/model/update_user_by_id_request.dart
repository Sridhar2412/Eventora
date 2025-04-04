//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'update_user_by_id_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateUserByIdRequest {
  /// Returns a new [UpdateUserByIdRequest] instance.
  UpdateUserByIdRequest({
    this.mobile,
    this.fullname,
    this.email,
    this.password,
    this.dob,
    this.role,
    this.organization,
  });

  @JsonKey(
    name: r'mobile',
    required: false,
    includeIfNull: false,
  )
  String? mobile;

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
  UpdateUserByIdRequestRoleEnum? role;

  @JsonKey(
    name: r'organization',
    required: false,
    includeIfNull: false,
  )
  String? organization;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateUserByIdRequest &&
          other.mobile == mobile &&
          other.fullname == fullname &&
          other.email == email &&
          other.password == password &&
          other.dob == dob &&
          other.role == role &&
          other.organization == organization;

  @override
  int get hashCode =>
      mobile.hashCode +
      fullname.hashCode +
      email.hashCode +
      password.hashCode +
      dob.hashCode +
      role.hashCode +
      organization.hashCode;

  factory UpdateUserByIdRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserByIdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserByIdRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum UpdateUserByIdRequestRoleEnum {
  @JsonValue(r'ADMIN')
  ADMIN(r'ADMIN'),
  @JsonValue(r'ORGANIZER')
  ORGANIZER(r'ORGANIZER'),
  @JsonValue(r'USER')
  USER(r'USER');

  const UpdateUserByIdRequestRoleEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
