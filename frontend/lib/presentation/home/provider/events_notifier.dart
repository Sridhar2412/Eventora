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
  late RSVPApi _rsvpRepo;
  @override
  UserState<EventStateModel> build() {
    _repo = ref.read(apiProvider).getEventsApi();
    _rsvpRepo = ref.read(apiProvider).getRSVPApi();
    return UserState(data: EventStateModel());
  }

  void init() {
    _repo = ref.read(apiProvider).getEventsApi();
    _rsvpRepo = ref.read(apiProvider).getRSVPApi();
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

  Future<String?> getEventListByCategory(
      {required EventListByCategoryRequestCategoryEnum category}) async {
    String? res;

    final result = await _repo
        .getEventListByType(
            eventListByCategoryRequest:
                EventListByCategoryRequest(category: category))
        .guard<EventListByCategoryResponse>();

    if (result.data != null) {
      final newData =
          state.data.copyWith(eventByCategoryList: result.data ?? []);
      state = state.copyWith(error: '', loading: false, data: newData);
    }
    return res;
  }

  Future<String?> getEventById({required int eventId}) async {
    String? res;

    final result = await _repo.getEventById(id: eventId).guard<Event>();

    final newData = state.data.copyWith(myEvent: result);
    state = state.copyWith(error: '', loading: false, data: newData);
    return res;
  }

  Future<bool?> getRsvpStatus({
    required int eventId,
    required int userId,
  }) async {
    final result = await _rsvpRepo
        .apiRsvpGetMyRsvpStatusPost(
            updateRsvpRequest:
                UpdateRsvpRequest(userId: userId, eventId: eventId))
        .guard<bool>();

    return result;
  }

  Future<bool?> updateRsvpStatus({
    required int eventId,
    required int userId,
  }) async {
    final result = await _rsvpRepo
        .apiRsvpUpdateRsvpPost(
            updateRsvpRequest:
                UpdateRsvpRequest(userId: userId, eventId: eventId))
        .guard();
    final data = await getRsvpStatus(eventId: eventId, userId: userId);
    return data;
  }
}
