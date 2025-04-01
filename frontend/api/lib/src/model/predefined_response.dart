//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/predefined.dart';
import 'package:json_annotation/json_annotation.dart';

part 'predefined_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PredefinedResponse {
  /// Returns a new [PredefinedResponse] instance.
  PredefinedResponse({
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
  Predefined? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PredefinedResponse &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory PredefinedResponse.fromJson(Map<String, dynamic> json) =>
      _$PredefinedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PredefinedResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
