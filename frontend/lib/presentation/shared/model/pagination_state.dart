import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_state.freezed.dart';
part 'pagination_state.g.dart';

@freezed
class PaginationState<T> with _$PaginationState<T> {
  factory PaginationState({
    @Default(true) bool loading,
    @Default(false) bool loadMore,
    @Default(0) int page,
    @Default(10) int pageSize,
    @Default('') String error,
    required T data,
    @Default(FilterState()) FilterState filter,
  }) = _PaginationState;
}

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    @Default('') String searchBy,
    @Default('') String startDateFilter,
    @Default('') String endDateFilter,
    @Default('') String isDeactivate,
    @Default('') String isDelete,
  }) = _FilterState;

  factory FilterState.fromJson(Map<String, dynamic> json) =>
      _$FilterStateFromJson(json);
}
