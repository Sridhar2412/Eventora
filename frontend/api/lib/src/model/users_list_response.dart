//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_list_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UsersListResponse {
  /// Returns a new [UsersListResponse] instance.
  UsersListResponse({
    this.status,
    this.code,
    this.data,
  });

  @JsonKey(
    name: r'status',
    required: false,
    includeIfNull: false,
  )
  String? status;

  @JsonKey(
    name: r'code',
    required: false,
    includeIfNull: false,
  )
  int? code;

  @JsonKey(
    name: r'data',
    required: false,
    includeIfNull: false,
  )
  List<User>? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersListResponse &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory UsersListResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersListResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
