// import 'package:api/api.dart';
import 'package:api/api.dart';
import 'package:flutter_master/core/extension/future.dart';
import 'package:flutter_master/core/providers/token_provider.dart';
import 'package:flutter_master/data/helper/api_client.dart';
import 'package:flutter_master/presentation/shared/model/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, UserState<User>>((ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends StateNotifier<UserState<User>> {
// ignore: avoid_public_notifier_properties
  ProfileNotifier(this.ref) : super(UserState(data: User())) {
    init();
  }
  final Ref ref;
  late UsersApi _repo;
  @override
  UserState<User> build() {
    _repo = ref.read(apiProvider).getUsersApi();
    return UserState(data: User());
  }

  void init() {
    _repo = ref.read(apiProvider).getUsersApi();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setUser(User user) {
    state = state.copyWith(data: user);
  }

  Future<bool?> getUserByToken() async {
    bool? res;
    final result = await _repo
        .getUserByToken(
            authorization:
                'Bearer ${ref.read(tokenNotifierProvider).accessToken}')
        .guard<UserResponse>();
    if (result.data != null) {
      ref.read(profileNotifierProvider.notifier).setUser(result.data ?? User());
    } else {
      res = true;
    }
    return res;
  }
}
