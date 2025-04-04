//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'update_user_by_id400_response_error.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateUserById400ResponseError {
  /// Returns a new [UpdateUserById400ResponseError] instance.
  UpdateUserById400ResponseError({
    this.message,
  });

  @JsonKey(
    name: r'message',
    required: false,
    includeIfNull: false,
  )
  String? message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateUserById400ResponseError && other.message == message;

  @override
  int get hashCode => message.hashCode;

  factory UpdateUserById400ResponseError.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserById400ResponseErrorFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserById400ResponseErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
