// import 'package:api/api.dart';
import 'package:api/api.dart';
import 'package:flutter_master/core/extension/future.dart';
import 'package:flutter_master/data/helper/api_client.dart';
import 'package:flutter_master/domain/model/event_state_model.dart';
import 'package:flutter_master/presentation/shared/model/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventNotifierProvider =
    StateNotifierProvider<EventNotifier, UserState<EventStateModel>>((ref) {
  return EventNotifier(ref);
});

class EventNotifier extends StateNotifier<UserState<EventStateModel>> {
// ignore: avoid_public_notifier_properties
  EventNotifier(this.ref) : super(UserState(data: EventStateModel())) {
    init();
  }
  final Ref ref;
  late EventsApi _repo;
  @override
  UserState<EventStateModel> build() {
    _repo = ref.read(apiProvider).getEventsApi();
    return UserState(data: EventStateModel());
  }

  void init() {
    _repo = ref.read(apiProvider).getEventsApi();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String?> getEventList() async {
    String? res;
    // final result = await AsyncValue.guard(() async {
    //   return _repo.getAllEvents().guard<EventsListResponse>();
    // });
    final result = await _repo.getAllEvents().guard<EventsListResponse>();

    // if (result is! AsyncError && result is! AsyncLoading) {
    //   final newData = state.data.copyWith(eventList: result.value?.data ?? []);
    //   state = state.copyWith(error: '', loading: false, data: newData);
    // } else if (result is AsyncError) {
    //   res = result.error.toString();
    // }
    if (result.data != null) {
      final newData = state.data.copyWith(eventList: result.data ?? []);
      state = state.copyWith(error: '', loading: false, data: newData);
    }
    return res;
  }

  Future<String?> getUpcomingEventList() async {
    String? res;

    final result = await _repo
        .getAllEvents(isUpcoming: true.toString())
        .guard<EventsListResponse>();

    if (result.data != null) {
      final newData = state.data.copyWith(upcomingEventList: result.data ?? []);
      state = state.copyWith(error: '', loading: false, data: newData);
    }
    return res;
  }
}
