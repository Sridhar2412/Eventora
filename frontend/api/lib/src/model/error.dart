//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/error_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Error {
  /// Returns a new [Error] instance.
  Error({
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
  int? code;

  @JsonKey(
    name: r'error',
    required: false,
    includeIfNull: false,
  )
  ErrorError? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Error &&
          other.status == status &&
          other.code == code &&
          other.error == error;

  @override
  int get hashCode => status.hashCode + code.hashCode + error.hashCode;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
