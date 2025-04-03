import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/future.dart';
import 'package:flutter_master/data/helper/api_client.dart';
import 'package:flutter_master/domain/model/event_state_model.dart';
import 'package:flutter_master/presentation/shared/model/pagination_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/debounce.dart';

final myEventListNotifierProvider = StateNotifierProvider.family<
    MyEventListingListNotifier, PaginationState<EventStateModel>, int>((
  ref,
  type,
) {
  return MyEventListingListNotifier(
    ref,
    type,
  );
});

class MyEventListingListNotifier
    extends StateNotifier<PaginationState<EventStateModel>> {
  MyEventListingListNotifier(
    this._ref,
    this.type,
  ) : super(
          PaginationState(
            data: const EventStateModel(),
          ),
        ) {
    init();
  }
  final int type;
  final Ref _ref;
  final TextEditingController searchTxtController = TextEditingController();
  late EventsApi _repo;
  final debounce = Debounce(millisecond: 200);

  static final Map<int, String> myEventTabMap = {
    0: 'PENDING',
    1: 'TODAY',
    2: 'UPCOMING',
  };

  void init() {
    _repo = _ref.read(apiProvider).getEventsApi();
    // searchTxtController.addListener(observer);
  }

  @override
  void dispose() {
    debounce.dispose();
    searchTxtController.dispose();
    super.dispose();
  }

  void stopLoading() {
    state = state.copyWith(loading: false);
  }

  Future<void> getMyEventList({required int userId}) async {
    final result = await _repo
        .getMyEvents(
            myEventListRequest: MyEventListRequest(
          userId: userId,
          isPast: myEventTabMap[type] == 'PENDING',
          isUpcoming: myEventTabMap[type] == 'UPCOMING',
          isToday: myEventTabMap[type] == 'TODAY',
        ))
        .guard<EventsListResponse>();
    if (result.data != null) {
      final newData = state.data.copyWith(myEventList: result.data ?? []);
      state = state.copyWith(error: '', loading: false, data: newData);
    }
    // result.fold(onException, (result) {
    //   state = state.copyWith(
    //     data: state.data.copyWith(
    //       MyEventList: [
    //         ...state.data.MyEventList,
    //         ...result,
    //       ],
    //     ),
    //     loadMore: result.length == state.pageSize,
    //     error: '',
    //     loading: false,
    //     pageNumber: state.pageNumber + 1,
    //   );
    // });
  }

  // void onData(List<MyEventModel> result) {
  //   state = state.copyWith(
  //     data: state.data.copyWith(
  //       MyEventList: [...state.data.MyEventList, ...result],
  //     ),
  //     loadMore: result.length == state.pageSize,
  //     error: '',
  //     loading: false,
  //     pageNumber: state.pageNumber + 1,
  //   );
  // }

  // Future<String?> rejectMyEvent(int MyEventId) async {
  //   String? response;
  //   state = state.copyWith(loading: true);
  //   final List<Predefined> MyEventStatusList = _ref.read(
  //     predefinedNotifierProvider(EntityType.MyEventStatus),
  //   );

  //   // if (MyEventStatusList.isEmpty) {
  //   //   state = state.copyWith(error: 'Something went wrong', loading: false);
  //   //   return state.error;
  //   // }
  //   final startStatusId = MyEventStatusList.firstWhere(
  //       (element) => element.code == 'MyEvent-REJECTED');
  //   final res = await _ref.read(MyEventRepoProvider).updateMyEvent(
  //         MyEventId: MyEventId,
  //         startStatusId: startStatusId.predefinedId,
  //       );
  //   await res.fold((l) {
  //     response = l.message;
  //     state = state.copyWith(loading: false, error: l.message);
  //   }, (r) async {
  //     state = state.copyWith(loading: false, error: '');
  //     clearState();
  //     await getMyEventList();
  //   });
  //   return response;
  // }

  // void onException(AppException error) {
  //   state = state.copyWith(error: error.message, loading: false);
  // }

  // Future<void> loadMore() async {
  //   if (state.loadMore) {
  //     await getMyEventList();
  //   }
  // }

  // void reset() {
  //   state = PaginationState(data: const MyEventListing(), filter: state.filter);
  // }

  void clearState({bool stopLoading = false}) {
    final newData = state.data.copyWith(myEventList: []);
    state = state.copyWith(
      data: newData,
      loading: !stopLoading,
    );
    // state = state.copyWith(data: newData, loading: !stopLoading, pageNumber: 1);
  }

  // void updateDateFilter(
  //   DateTime? startDate,
  //   DateTime? endDate,
  // ) {
  //   if (startDate != null && endDate != null) {
  //     final newFilterState = state.data.filter.copyWith(
  //       startDate: startDate.toDDMMYY(),
  //       endDate: endDate.toDDMMYY(),
  //     );
  //     final newData =
  //         state.data.copyWith(filter: newFilterState, MyEventList: []);
  //     state = state.copyWith(
  //       data: newData,
  //       loading: true,
  //       pageNumber: 1,
  //     );
  //     getMyEventList();
  //   }
  // }

  // void clearDateFilter() {
  //   final newFilterState = state.data.filter.copyWith(
  //     startDate: '',
  //     endDate: '',
  //   );
  //   final newData =
  //       state.data.copyWith(filter: newFilterState, MyEventList: []);
  //   state = state.copyWith(
  //     data: newData,
  //     loading: true,
  //     pageNumber: 1,
  //   );
  //   getMyEventList();
  // }

  // void observer() {
  //   debounce.run(() {
  //     state = state.copyWith(
  //       loading: true,
  //       data: state.data.copyWith(MyEventList: []),
  //       pageNumber: 1,
  //     );
  //     getMyEventList();
  //   });
  // }
}
