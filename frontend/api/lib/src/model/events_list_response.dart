//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events_list_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EventsListResponse {
  /// Returns a new [EventsListResponse] instance.
  EventsListResponse({
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
  List<Event>? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsListResponse &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory EventsListResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventsListResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
