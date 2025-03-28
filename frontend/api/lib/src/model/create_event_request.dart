//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'create_event_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateEventRequest {
  /// Returns a new [CreateEventRequest] instance.
  CreateEventRequest({
    this.eventName,
    this.eventDate,
    this.city,
    this.description,
    this.category,
    this.latitude,
    this.longitude,
  });

  @JsonKey(
    name: r'event_name',
    required: false,
    includeIfNull: false,
  )
  String? eventName;

  @JsonKey(
    name: r'event_date',
    required: false,
    includeIfNull: false,
  )
  DateTime? eventDate;

  @JsonKey(
    name: r'city',
    required: false,
    includeIfNull: false,
  )
  String? city;

  @JsonKey(
    name: r'description',
    required: false,
    includeIfNull: false,
  )
  String? description;

  @JsonKey(
    name: r'category',
    required: false,
    includeIfNull: false,
  )
  String? category;

  @JsonKey(
    name: r'latitude',
    required: false,
    includeIfNull: false,
  )
  double? latitude;

  @JsonKey(
    name: r'longitude',
    required: false,
    includeIfNull: false,
  )
  double? longitude;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateEventRequest &&
          other.eventName == eventName &&
          other.eventDate == eventDate &&
          other.city == city &&
          other.description == description &&
          other.category == category &&
          other.latitude == latitude &&
          other.longitude == longitude;

  @override
  int get hashCode =>
      eventName.hashCode +
      eventDate.hashCode +
      city.hashCode +
      description.hashCode +
      category.hashCode +
      latitude.hashCode +
      longitude.hashCode;

  factory CreateEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEventRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
