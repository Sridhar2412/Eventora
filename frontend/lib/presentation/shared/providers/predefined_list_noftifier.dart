// import 'package:api/api.dart';
import 'package:api/api.dart';
import 'package:flutter_master/data/helper/api_client.dart';
import 'package:flutter_master/presentation/shared/model/predefined_state_model.dart';
import 'package:flutter_master/presentation/shared/model/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final predefinedListNotifierProvider =
    StateNotifierProvider<EventNotifier, UserState<PredefinedStateModel>>(
        (ref) {
  return EventNotifier(ref);
});

class EventNotifier extends StateNotifier<UserState<PredefinedStateModel>> {
// ignore: avoid_public_notifier_properties
  EventNotifier(this.ref) : super(UserState(data: PredefinedStateModel())) {
    init();
  }
  final Ref ref;
  late PredefinedApi _repo;
  @override
  UserState<PredefinedStateModel> build() {
    _repo = ref.read(apiProvider).getPredefinedApi();
    return UserState(data: PredefinedStateModel());
  }

  void init() {
    _repo = ref.read(apiProvider).getPredefinedApi();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String?> getPredefinedList(
      {required PredefinedListRequestEntityTypeEnum entityType}) async {
    String? res;

    final result = await _repo.getPredefinedList(
        predefinedListRequest: PredefinedListRequest(entityType: entityType));
    if (result.data != null) {
      final newData =
          state.data.copyWith(categoryList: result.data?.data ?? []);
      state = state.copyWith(error: '', loading: false, data: newData);
    }
    return res;
  }
}
