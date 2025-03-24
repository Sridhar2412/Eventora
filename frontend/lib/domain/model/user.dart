import 'package:flutter_master/domain/model/chat_model.dart';
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
    @Default(0) double balance,
    @Default(0) double daysLeft,
    @Default(<User>[]) List<User> contactList,
    @Default(<Chat>[]) List<Chat> chatList,
    @Default(<Chat>[]) List<Chat> userChatList,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class People with _$People {
  const factory People({
    @Default(-1) int id,
    @Default('') String name,
    @Default('') String profileImgUrl,
  }) = _People;

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);
}
