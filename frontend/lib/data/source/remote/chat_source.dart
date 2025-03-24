import 'package:dio/dio.dart';
import 'package:flutter_master/domain/model/chat_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/constants.dart';
import '../../helper/dio_instance.dart';

part 'chat_source.g.dart';

@riverpod
ChatSource chatSource(ChatSourceRef ref) =>
    ChatSource(ref.watch(dioInstanceProvider));

@RestApi()
abstract class ChatSource {
  factory ChatSource(Dio dio) => _ChatSource(dio);

  @POST(Constants.saveChat)
  Future<Chat> saveChat(@Body() Map<String, dynamic> body);

  @GET(Constants.getChatList)
  Future<List<Chat>> getChatList();

  @GET(Constants.getChatListById)
  Future<List<Chat>> getChatListById(@Path() int id);
}
