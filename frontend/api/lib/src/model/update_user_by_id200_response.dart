//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'update_user_by_id200_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateUserById200Response {
  /// Returns a new [UpdateUserById200Response] instance.
  UpdateUserById200Response({
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
  String? code;

  @JsonKey(
    name: r'data',
    required: false,
    includeIfNull: false,
  )
  String? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateUserById200Response &&
          other.status == status &&
          other.code == code &&
          other.data == data;

  @override
  int get hashCode => status.hashCode + code.hashCode + data.hashCode;

  factory UpdateUserById200Response.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserById200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserById200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
