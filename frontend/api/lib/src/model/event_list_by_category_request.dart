//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'event_list_by_category_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EventListByCategoryRequest {
  /// Returns a new [EventListByCategoryRequest] instance.
  EventListByCategoryRequest({
    required this.category,
  });

  @JsonKey(
    name: r'category',
    required: true,
    includeIfNull: false,
  )
  EventListByCategoryRequestCategoryEnum category;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventListByCategoryRequest && other.category == category;

  @override
  int get hashCode => category.hashCode;

  factory EventListByCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$EventListByCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EventListByCategoryRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum EventListByCategoryRequestCategoryEnum {
  @JsonValue(r'Social')
  social(r'Social'),
  @JsonValue(r'Sports')
  sports(r'Sports'),
  @JsonValue(r'Travel')
  travel(r'Travel'),
  @JsonValue(r'Community')
  community(r'Community'),
  @JsonValue(r'Games')
  games(r'Games'),
  @JsonValue(r'Tech')
  tech(r'Tech'),
  @JsonValue(r'Education')
  education(r'Education'),
  @JsonValue(r'Business')
  business(r'Business'),
  @JsonValue(r'Art')
  art(r'Art'),
  @JsonValue(r'Dancing')
  dancing(r'Dancing'),
  @JsonValue(r'Music')
  music(r'Music'),
  @JsonValue(r'Political')
  political(r'Political');

  const EventListByCategoryRequestCategoryEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
