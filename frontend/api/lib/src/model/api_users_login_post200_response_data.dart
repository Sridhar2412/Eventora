//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'api_users_login_post200_response_data.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ApiUsersLoginPost200ResponseData {
  /// Returns a new [ApiUsersLoginPost200ResponseData] instance.
  ApiUsersLoginPost200ResponseData({
    this.accessToken,
  });

  @JsonKey(
    name: r'accessToken',
    required: false,
    includeIfNull: false,
  )
  String? accessToken;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiUsersLoginPost200ResponseData &&
          other.accessToken == accessToken;

  @override
  int get hashCode => accessToken.hashCode;

  factory ApiUsersLoginPost200ResponseData.fromJson(
          Map<String, dynamic> json) =>
      _$ApiUsersLoginPost200ResponseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApiUsersLoginPost200ResponseDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
