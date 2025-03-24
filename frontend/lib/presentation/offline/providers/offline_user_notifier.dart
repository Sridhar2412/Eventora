import 'package:flutter/widgets.dart';
import 'package:flutter_master/core/providers/database_box_provider.dart';
import 'package:flutter_master/presentation/offline/model/offline_user_entity_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final offlineUserNotifierProvider =
    StateNotifierProvider<OfflineUserNotifier, OfflineUser>((_ref) {
  return OfflineUserNotifier(_ref);
});

class OfflineUserNotifier extends StateNotifier<OfflineUser> {
  OfflineUserNotifier(this.ref) : super(OfflineUser());

  final Ref ref;
  final TextEditingController profileImageCtrl = TextEditingController();

  void setProfileImg() {
    final boxState = ref.read(databaseBoxProvider).store.box<OfflineUser>();
    final List<OfflineUser> user = List.from(boxState.getAll());
    user.insert(
        0,
        OfflineUser(
          name: user.first.name,
          email: user.first.email,
          // phone: user.first.phone,
          // companyName: user.first.companyName,
          // company: user.first.company,
          // profileImgUrl: profileImageCtrl.text.trim(),
        ));
    boxState.removeAll();
    boxState.put(user.first);
  }

  void addUser(OfflineUser user) {
    final boxState = ref.read(databaseBoxProvider).store.box<OfflineUser>();
    boxState.put(user);
  }

  OfflineUser getOfflineUser() {
    final boxState = ref.read(databaseBoxProvider).store.box<OfflineUser>();
    final offlineUser = boxState.getAll();
    final OfflineUser response = offlineUser.first ?? OfflineUser();
    state = offlineUser.first ?? OfflineUser();
    return response;
  }
}
