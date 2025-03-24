import 'package:api/api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_master/core/extension/future.dart';
import 'package:flutter_master/core/providers/token_provider.dart';
import 'package:flutter_master/core/utils/debounce.dart';
import 'package:flutter_master/data/helper/api_client.dart';
import 'package:flutter_master/data/repository/user_repo.dart';
import 'package:flutter_master/domain/model/chat_model.dart';
import 'package:flutter_master/domain/repository/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/model/user.dart';
import '../../shared/model/user_state.dart';

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, UserState<User>>((ref) {
  return HomeNotifier(ref);
});

class HomeNotifier extends StateNotifier<UserState<User>> {
  HomeNotifier(this.ref)
      : super(
          UserState(
            data: const User(),
          ),
        ) {
    init();
  }

  final Ref ref;
  late UserRepository _repo;
  late UserApi _userRepo;
  final debounce = Debounce(millisecond: 1000);

  final TextEditingController profileImageCtrl = TextEditingController();

  //Save Chat
  final saveChatKey = GlobalKey<FormState>();
  final TextEditingController messageCtrl = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();
  void init() {
    searchCtrl.addListener(onSearch);
    _repo = ref.read(userRepoProvider);
    _userRepo = ref.read(apiProvider).getUserApi();
  }

  @override
  void dispose() {
    messageCtrl.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  void setChats(List<Chat> chatList) {
    final newData = state.data.copyWith(userChatList: chatList);
    state = state.copyWith(data: newData, error: '', loading: false);
  }

  void clearChats() {
    final newData = state.data.copyWith(userChatList: []);
    state = state.copyWith(data: newData, error: '', loading: false);
  }

  Future<void> onSearch() async {
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(seconds: 1));
    final List<Chat> newList = [];
    for (var element in state.data.chatList) {
      if (element.message.toLowerCase().contains(searchCtrl.text.trim())) {
        newList.add(element);
      }
    }
    final newData = state.data.copyWith(chatList: newList);
    state = state.copyWith(data: newData, loading: false);
    if (searchCtrl.text.isEmpty) {
      // await getChatsList();
    }
  }

  Future<String?> getUser() async {
    String? response;
    state = state.copyWith(loading: true);

    state = state.copyWith(loading: true);
    final data = await _userRepo
        .getUserData(
            authorization:
                'Bearer ${ref.read(tokenNotifierProvider).accessToken}')
        .guard<UserResponse>();
    state = state.copyWith(
        data: User(
          id: data.data?.id ?? 0,
          name: data.data?.name ?? '0',
          email: data.data?.email ?? '0',
        ),
        loading: false,
        error: '');
    // result.logWarning();
    // result.fold((l) {
    //   state = state.copyWith(error: l.message, loading: false);
    //   res = l.message;
    // }, (r) async {
    state = state.copyWith(error: '', loading: false); // data.fold((l) {
    //   response = l.message;
    //   state = state.copyWith(loading: false, error: l.message);
    // }, (r) {
    //   state = state.copyWith(loading: false, error: '', data: r);
    // });
    return response;
  }

  Future<String?> getUserById(int userId) async {
    String? response;
    state = state.copyWith(loading: true);
    final data = await _repo.getUserById(userId);
    data.fold((l) {
      response = l.message;
      state = state.copyWith(loading: false, error: l.message);
    }, (r) {
      state = state.copyWith(loading: false, error: '', data: r);
    });
    return response;
  }

  Future<String?> getContactList() async {
    String? response;
    state = state.copyWith(loading: true);
    final data = await _repo.getUserList();
    data.fold((l) {
      response = l.message;

      state = state.copyWith(error: l.message, loading: false);
    }, (r) {
      final newData = state.data.copyWith(contactList: r);
      state = state.copyWith(data: newData, loading: false);
    });
    return response;
  }

  Future<String?> saveChat(User user, bool isCredit) async {
    String? response;
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(seconds: 1));
    final newData = state.data.copyWith(chatList: [
      ...state.data.chatList,
      Chat(
        id: state.data.chatList.isNotEmpty
            ? state.data.chatList.last.id + 1
            : 1,
        message: messageCtrl.text.trim(),
        senderId: isCredit ? user.id : state.data.id,
        recieverId: isCredit ? state.data.id : user.id,
      )
    ]);
    state = state.copyWith(data: newData, loading: false);

    messageCtrl.clear();
    return response;
  }
}
