//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'error_error.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorError {
  /// Returns a new [ErrorError] instance.
  ErrorError({
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
      identical(this, other) || other is ErrorError && other.message == message;

  @override
  int get hashCode => message.hashCode;

  factory ErrorError.fromJson(Map<String, dynamic> json) =>
      _$ErrorErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
