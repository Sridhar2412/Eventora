//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/api_users_login_post200_response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_users_login_post200_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ApiUsersLoginPost200Response {
  /// Returns a new [ApiUsersLoginPost200Response] instance.
  ApiUsersLoginPost200Response({
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
  ApiUsersLoginPost200ResponseData? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiUsersLoginPost200Response &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory ApiUsersLoginPost200Response.fromJson(Map<String, dynamic> json) =>
      _$ApiUsersLoginPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUsersLoginPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
