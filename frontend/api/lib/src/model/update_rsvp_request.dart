//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'update_rsvp_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateRsvpRequest {
  /// Returns a new [UpdateRsvpRequest] instance.
  UpdateRsvpRequest({
    this.userId,
    this.eventId,
  });

  /// The ID of the user
  @JsonKey(
    name: r'userId',
    required: false,
    includeIfNull: false,
  )
  int? userId;

  /// The ID of the event
  @JsonKey(
    name: r'eventId',
    required: false,
    includeIfNull: false,
  )
  int? eventId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateRsvpRequest &&
          other.userId == userId &&
          other.eventId == eventId;

  @override
  int get hashCode => userId.hashCode + eventId.hashCode;

  factory UpdateRsvpRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRsvpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateRsvpRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
