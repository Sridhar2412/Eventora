//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_users_list_get200_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ApiUsersListGet200Response {
  /// Returns a new [ApiUsersListGet200Response] instance.
  ApiUsersListGet200Response({
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
      other is ApiUsersListGet200Response &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory ApiUsersListGet200Response.fromJson(Map<String, dynamic> json) =>
      _$ApiUsersListGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUsersListGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
