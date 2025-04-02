import 'package:api/api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_state_model.freezed.dart';
part 'event_state_model.g.dart';

@freezed
class EventStateModel with _$EventStateModel {
  const factory EventStateModel({
    @Default(<Event>[]) List<Event> eventList,
    @Default(<Event>[]) List<Event> upcomingEventList,
    @Default(<Event>[]) List<Event> eventByCategoryList,
    Event? myEvent,
  }) = _EventStateModel;

  factory EventStateModel.fromJson(Map<String, dynamic> json) =>
      _$EventStateModelFromJson(json);
}
