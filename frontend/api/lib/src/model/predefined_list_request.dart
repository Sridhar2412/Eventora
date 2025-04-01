//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'predefined_list_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PredefinedListRequest {
  /// Returns a new [PredefinedListRequest] instance.
  PredefinedListRequest({
    required this.entityType,
  });

  @JsonKey(
    name: r'entityType',
    required: true,
    includeIfNull: false,
  )
  PredefinedListRequestEntityTypeEnum entityType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PredefinedListRequest && other.entityType == entityType;

  @override
  int get hashCode => entityType.hashCode;

  factory PredefinedListRequest.fromJson(Map<String, dynamic> json) =>
      _$PredefinedListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PredefinedListRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum PredefinedListRequestEntityTypeEnum {
  @JsonValue(r'EVENT-CATEGORY')
  EVENT_CATEGORY(r'EVENT-CATEGORY');

  const PredefinedListRequestEntityTypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
