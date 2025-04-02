//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api/src/model/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_list_by_category_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EventListByCategoryResponse {
  /// Returns a new [EventListByCategoryResponse] instance.
  EventListByCategoryResponse({
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
      other is EventListByCategoryResponse &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory EventListByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$EventListByCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventListByCategoryResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
