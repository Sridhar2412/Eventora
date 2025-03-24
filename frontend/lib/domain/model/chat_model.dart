import 'package:flutter_master/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @Default(<Chat>[]) List<Chat> chats,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}

@freezed
class Chat with _$Chat {
  const factory Chat({
    @Default(0) int id,
    @Default(0) int senderId,
    @Default(0) int recieverId,
    @Default('') String message,
    @Default('') String createdAt,
    @Default(User()) User sender,
    @Default(User()) User reciever,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
