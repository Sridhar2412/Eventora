//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'login_response_data.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginResponseData {
  /// Returns a new [LoginResponseData] instance.
  LoginResponseData({
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
      other is LoginResponseData && other.accessToken == accessToken;

  @override
  int get hashCode => accessToken.hashCode;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
