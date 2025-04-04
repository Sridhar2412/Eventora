//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/update_user_by_id500_response_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_by_id500_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateUserById500Response {
  /// Returns a new [UpdateUserById500Response] instance.
  UpdateUserById500Response({
    this.status,
    this.code,
    this.error,
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
  String? code;

  @JsonKey(
    name: r'error',
    required: false,
    includeIfNull: false,
  )
  UpdateUserById500ResponseError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateUserById500Response &&
          other.status == status &&
          other.code == code &&
          other.error == error;

  @override
  int get hashCode => status.hashCode + code.hashCode + error.hashCode;

  factory UpdateUserById500Response.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserById500ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserById500ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
