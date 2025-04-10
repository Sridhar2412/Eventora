//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class User {
  /// Returns a new [User] instance.
  User({
    this.userId,
    this.fullname,
    this.email,
    this.mobile,
    this.password,
    this.dob,
    this.role,
    this.organization,
  });

  @JsonKey(
    name: r'userId',
    required: false,
    includeIfNull: false,
  )
  int? userId;

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
  UserRoleEnum? role;

  @JsonKey(
    name: r'organization',
    required: false,
    includeIfNull: false,
  )
  String? organization;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          other.userId == userId &&
          other.fullname == fullname &&
          other.email == email &&
          other.mobile == mobile &&
          other.password == password &&
          other.dob == dob &&
          other.role == role &&
          other.organization == organization;

  @override
  int get hashCode =>
      userId.hashCode +
      fullname.hashCode +
      email.hashCode +
      mobile.hashCode +
      password.hashCode +
      dob.hashCode +
      role.hashCode +
      organization.hashCode;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum UserRoleEnum {
  @JsonValue(r'ADMIN')
  ADMIN(r'ADMIN'),
  @JsonValue(r'ORGANIZER')
  ORGANIZER(r'ORGANIZER'),
  @JsonValue(r'USER')
  USER(r'USER');

  const UserRoleEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
