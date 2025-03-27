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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          other.userId == userId &&
          other.fullname == fullname &&
          other.email == email &&
          other.mobile == mobile &&
          other.password == password;

  @override
  int get hashCode =>
      userId.hashCode +
      fullname.hashCode +
      email.hashCode +
      mobile.hashCode +
      password.hashCode;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
