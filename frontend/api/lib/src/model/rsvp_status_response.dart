//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'rsvp_status_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RsvpStatusResponse {
  /// Returns a new [RsvpStatusResponse] instance.
  RsvpStatusResponse({
    this.status,
    this.code,
    this.message,
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
  String? code;

  @JsonKey(
    name: r'message',
    required: false,
    includeIfNull: false,
  )
  String? message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RsvpStatusResponse &&
          other.status == status &&
          other.code == code &&
          other.message == message;

  @override
  int get hashCode => status.hashCode + code.hashCode + message.hashCode;

  factory RsvpStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$RsvpStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RsvpStatusResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
