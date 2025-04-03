//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'my_event_list_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MyEventListRequest {
  /// Returns a new [MyEventListRequest] instance.
  MyEventListRequest({
    required this.userId,
    this.isUpcoming = false,
    this.isPast = false,
    this.isToday = false,
  });

  /// The ID of the user for whom to fetch RSVPed events.
  @JsonKey(
    name: r'userId',
    required: true,
    includeIfNull: false,
  )
  int userId;

  /// Flag to filter for upcoming events (e.g., `true` for upcoming events).
  @JsonKey(
    defaultValue: false,
    name: r'isUpcoming',
    required: false,
    includeIfNull: false,
  )
  bool? isUpcoming;

  /// Flag to filter for past events (e.g., `true` for past events).
  @JsonKey(
    defaultValue: false,
    name: r'isPast',
    required: false,
    includeIfNull: false,
  )
  bool? isPast;

  /// Flag to filter for today's events (e.g., `true` for today's events).
  @JsonKey(
    defaultValue: false,
    name: r'isToday',
    required: false,
    includeIfNull: false,
  )
  bool? isToday;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyEventListRequest &&
          other.userId == userId &&
          other.isUpcoming == isUpcoming &&
          other.isPast == isPast &&
          other.isToday == isToday;

  @override
  int get hashCode =>
      userId.hashCode +
      isUpcoming.hashCode +
      isPast.hashCode +
      isToday.hashCode;

  factory MyEventListRequest.fromJson(Map<String, dynamic> json) =>
      _$MyEventListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MyEventListRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
