//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_users_id_get200_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ApiUsersIdGet200Response {
  /// Returns a new [ApiUsersIdGet200Response] instance.
  ApiUsersIdGet200Response({
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
  User? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiUsersIdGet200Response &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory ApiUsersIdGet200Response.fromJson(Map<String, dynamic> json) =>
      _$ApiUsersIdGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUsersIdGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
