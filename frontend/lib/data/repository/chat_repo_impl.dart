import 'package:dartz/dartz.dart';
import 'package:flutter_master/core/exception/app_exception.dart';
import 'package:flutter_master/core/extension/future.dart';
import 'package:flutter_master/data/source/remote/chat_source.dart';
import 'package:flutter_master/domain/model/chat_model.dart';
import 'package:flutter_master/domain/repository/chat_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repo_impl.g.dart';

@riverpod
ChatRepository chatRepo(ChatRepoRef ref) =>
    ChatRepositoryImpl(ref.read(chatSourceProvider));

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._source);

  final ChatSource _source;

  @override
  Future<Either<AppException, Chat>> saveChat(
      {required String message,
      required int senderId,
      required int recieverId}) {
    final Map<String, dynamic> body = {
      'message': message,
      'senderId': senderId,
      'recieverId': recieverId,
    };
    return _source.saveChat(body).guardFuture();
  }

  @override
  Future<Either<AppException, List<Chat>>> getChatList() {
    return _source.getChatList().guardFuture();
  }

  @override
  Future<Either<AppException, List<Chat>>> getChatListById(
      {required int userId}) {
    return _source.getChatListById(userId).guardFuture();
  }
}
