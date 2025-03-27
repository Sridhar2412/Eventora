import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default(<User>[]) List<User> users,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default(-1) int id,
    @Default('') String name,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String profileImgUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
