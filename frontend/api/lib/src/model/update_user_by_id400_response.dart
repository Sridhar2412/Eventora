//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/update_user_by_id400_response_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_by_id400_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateUserById400Response {
  /// Returns a new [UpdateUserById400Response] instance.
  UpdateUserById400Response({
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
  UpdateUserById400ResponseError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateUserById400Response &&
          other.status == status &&
          other.code == code &&
          other.error == error;

  @override
  int get hashCode => status.hashCode + code.hashCode + error.hashCode;

  factory UpdateUserById400Response.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserById400ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserById400ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
