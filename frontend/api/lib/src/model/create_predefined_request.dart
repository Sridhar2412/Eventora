//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'create_predefined_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreatePredefinedRequest {
  /// Returns a new [CreatePredefinedRequest] instance.
  CreatePredefinedRequest({
    this.parentId,
    this.entityType,
    this.name,
    this.code,
  });

  @JsonKey(
    name: r'parentId',
    required: false,
    includeIfNull: false,
  )
  int? parentId;

  @JsonKey(
    name: r'entityType',
    required: false,
    includeIfNull: false,
  )
  String? entityType;

  @JsonKey(
    name: r'name',
    required: false,
    includeIfNull: false,
  )
  String? name;

  @JsonKey(
    name: r'code',
    required: false,
    includeIfNull: false,
  )
  String? code;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatePredefinedRequest &&
          other.parentId == parentId &&
          other.entityType == entityType &&
          other.name == name &&
          other.code == code;

  @override
  int get hashCode =>
      parentId.hashCode + entityType.hashCode + name.hashCode + code.hashCode;

  factory CreatePredefinedRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePredefinedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePredefinedRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
