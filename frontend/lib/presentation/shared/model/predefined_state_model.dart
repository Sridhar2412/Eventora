import 'package:api/api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'predefined_state_model.freezed.dart';
part 'predefined_state_model.g.dart';

@freezed
class PredefinedStateModel with _$PredefinedStateModel {
  const factory PredefinedStateModel({
    @Default(<Predefined>[]) List<Predefined> categoryList,
  }) = _PredefinedStateModel;

  factory PredefinedStateModel.fromJson(Map<String, dynamic> json) =>
      _$PredefinedStateModelFromJson(json);
}
