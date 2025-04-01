//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'predefined.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Predefined {
  /// Returns a new [Predefined] instance.
  Predefined({
    this.predefinedId,
    this.parentId,
    this.entityType,
    this.name,
    this.code,
  });

  @JsonKey(
    name: r'predefinedId',
    required: false,
    includeIfNull: false,
  )
  int? predefinedId;

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
      other is Predefined &&
          other.predefinedId == predefinedId &&
          other.parentId == parentId &&
          other.entityType == entityType &&
          other.name == name &&
          other.code == code;

  @override
  int get hashCode =>
      predefinedId.hashCode +
      parentId.hashCode +
      entityType.hashCode +
      name.hashCode +
      code.hashCode;

  factory Predefined.fromJson(Map<String, dynamic> json) =>
      _$PredefinedFromJson(json);

  Map<String, dynamic> toJson() => _$PredefinedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
