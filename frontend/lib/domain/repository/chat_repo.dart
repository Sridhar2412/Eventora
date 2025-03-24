import 'package:dartz/dartz.dart';
import 'package:flutter_master/core/exception/app_exception.dart';
import 'package:flutter_master/domain/model/chat_model.dart';

abstract class ChatRepository {
  // Future<Either<AppException, Chat>> getChat();
  Future<Either<AppException, Chat>> saveChat({
    required String message,
    required int senderId,
    required int recieverId,
  });
  Future<Either<AppException, List<Chat>>> getChatList();
  Future<Either<AppException, List<Chat>>> getChatListById(
      {required int userId});
}
