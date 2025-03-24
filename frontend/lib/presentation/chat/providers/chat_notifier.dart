// ignore_for_file: avoid_public_notifier_properties
import 'package:flutter/material.dart';
import 'package:flutter_master/data/repository/chat_repo_impl.dart';
import 'package:flutter_master/domain/model/chat_model.dart';
import 'package:flutter_master/domain/model/user.dart';
import 'package:flutter_master/domain/repository/chat_repo.dart';
import 'package:flutter_master/presentation/home/providers/home_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/debounce.dart';
import '../../shared/model/user_state.dart';

final chatNotifierProvider =
    StateNotifierProvider<ChatNotifier, UserState<Chat>>((ref) {
  return ChatNotifier(ref);
});

class ChatNotifier extends StateNotifier<UserState<Chat>> {
  ChatNotifier(this.ref)
      : super(
          UserState(
            data: const Chat(),
          ),
        ) {
    init();
  }

  final Ref ref;
  late ChatRepository _repo;
  final debounce = Debounce(millisecond: 1000);

  //Save Chat
  final saveChatKey = GlobalKey<FormState>();
  final TextEditingController messageCtrl = TextEditingController();
  void init() {
    _repo = ref.read(chatRepoProvider);
  }

  @override
  void dispose() {
    debounce.dispose();
    messageCtrl.dispose();
    super.dispose();
  }

  Future<String?> getChatListById(
    int userId,
  ) async {
    String? response;
    ref.read(chatRepoProvider);
    state = state.copyWith(loading: true);
    final result = await _repo.getChatListById(userId: userId);
    result.fold((l) {
      state = state.copyWith(error: l.message, loading: false);
    }, (r) async {
      ref.read(homeNotifierProvider.notifier).setChats(r);
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(error: '', loading: false);
    });
    return response;
  }

  Future<String?> saveChat(
    User user,
  ) async {
    String? response;
    ref.read(chatRepoProvider);
    state = state.copyWith(loading: true);
    final result = await _repo.saveChat(
        senderId: ref.read(homeNotifierProvider).data.id,
        recieverId: user.id,
        message: messageCtrl.text.trim());

    result.fold((l) {
      state = state.copyWith(error: l.message, loading: false);
      messageCtrl.clear();
    }, (r) async {
      state = state.copyWith(error: '', loading: false);

      messageCtrl.clear();
      await getChatListById(user.id);
    });
    return response;
  }
}
