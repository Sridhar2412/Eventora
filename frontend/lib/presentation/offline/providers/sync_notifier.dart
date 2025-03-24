import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_master/domain/model/user.dart';
import 'package:flutter_master/presentation/home/providers/home_notifier.dart';
import 'package:flutter_master/presentation/offline/model/offline_user_entity_model.dart';
import 'package:flutter_master/presentation/offline/providers/offline_transaction_list_notiifier.dart';
import 'package:flutter_master/presentation/offline/providers/offline_user_notifier.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/database_box_provider.dart';
import '../../../core/providers/internet_connectivity_provider.dart';

part 'sync_notifier.g.dart';

@riverpod
class SyncNotifier extends _$SyncNotifier {
  @override
  void build() {
    return;
  }

  Future<void> sendUserDataToServer() async {
    if (ref
        .read(internetConnectionStateProvider.select((value) => value.data))) {
      await Future.delayed(const Duration(seconds: 1));
      await getUser();
      // await getTransactions();
    } else {
      ref.read(offlineUserNotifierProvider.notifier).getOfflineUser();
      // ref
      //     .read(offlineTransactionListNotifierProvider.notifier)
      //     .getOfflineTransactionList();
    }
  }

  Future<void> getUser() async {
    final users = await rootBundle.loadString(Assets.json.dummyUsers);
    final userList = UserModel.fromJson(jsonDecode(users));
    final List<OfflineUser> user = [];
    for (final element in userList.users) {
      user.add(OfflineUser(
          ids: element.id,
          name: element.name,
          email: element.email,
          daysLeft: element.daysLeft,
          balance: element.balance,
          profileImgUrl: element.profileImgUrl));
    }
    final boxState = ref.read(databaseBoxProvider).store.box<OfflineUser>();
    boxState.removeAll();
    boxState.put(user.first);
  }

  // Future<void> getTransactions() async {
  //   final state = ref.watch(homeNotifierProvider);
  //   final transactions = state.data.transactionList;
  //   final List<OfflineTransaction> transaction = [];
  //   for (final element in transactions) {
  //     transaction.add(OfflineTransaction(
  //       ids: element.id,
  //       title: element.title,
  //       product: element.product,
  //       amount: element.amount,
  //       isCredit: element.isCredit,
  //       user: element.user
  //     ));
  //   }
  //   final boxState =
  //       ref.read(databaseBoxProvider).store.box<OfflineTransaction>();
  //   boxState.removeAll();
  //   boxState.putMany(transaction);
  // }
}

final internetSwitchHomeProvider = StateProvider<Future<void>>((ref) async {
  final internetConnection = ref.watch(internetConnectionStateProvider);
  await Future.delayed(const Duration(seconds: 1));
  if (internetConnection.data) {
    await ref.read(syncNotifierProvider.notifier).sendUserDataToServer();
    // await ref.read(homeNotifierProvider.notifier).getProfile();
    await ref.read(homeNotifierProvider.notifier).getContactList();
    // await ref.read(homeNotifierProvider.notifier).getTransactionsList();
  } else {
    ref.read(offlineUserNotifierProvider.notifier).getOfflineUser();
    // ref
    //     .read(offlineTransactionListNotifierProvider.notifier)
    //     .getOfflineTransactionList();
  }
  return;
});

// final internetSwitchAlbumProvider = StateProvider<Future<void>>((ref) async {
//   final internetConnection = ref.watch(internetConnectionStateProvider);
//   await Future.delayed(const Duration(seconds: 1));
//   if (internetConnection.data) {
//     await ref.read(syncNotifierProvider.notifier).sendAlbumDataToServer();
//     await ref.read(homeNotifierProvider.notifier).getAlbums();
//   } else {
//     ref.read(offlineAlbumListNotifierProvider.notifier).getOfflineAlbumList();
//   }
//   return;
// });

// final internetSwitchPhotoProvider =
//     StateProvider.family<Future<void>, int>((ref, albumId) async {
//   final internetConnection = ref.watch(internetConnectionStateProvider);
//   await Future.delayed(const Duration(seconds: 1));
//   if (internetConnection.data) {
//     await ref
//         .read(syncNotifierProvider.notifier)
//         .sendPhotoDataToServer(albumId: albumId);
//     await ref.read(homeNotifierProvider.notifier).getPhotos(albumId);
//   } else {
//     ref.read(offlinePhotoListNotifierProvider.notifier).getOfflinePhotoList();
//   }
//   return;
// });

// final internetSwitchPostsProvider = StateProvider<Future<void>>((ref) async {
//   final internetConnection = ref.watch(internetConnectionStateProvider);
//   await Future.delayed(const Duration(seconds: 1));
//   if (internetConnection.data) {
//     await ref.read(syncNotifierProvider.notifier).sendPostsDataToServer();
//     await ref.read(homeNotifierProvider.notifier).getPosts();
//   } else {
//     ref.read(offlinePostListNotifierProvider.notifier).getOfflinePostList();
//   }
//   return;
// });

// final internetSwitchCommentsProvider =
//     StateProvider.family<Future<void>, int>((ref, postId) async {
//   final internetConnection = ref.watch(internetConnectionStateProvider);
//   await Future.delayed(const Duration(seconds: 1));
//   if (internetConnection.data) {
//     await ref
//         .read(syncNotifierProvider.notifier)
//         .sendCommentsDataToServer(postId: postId);
//     await ref.read(homeNotifierProvider.notifier).getComments(postId);
//   } else {
//     ref
//         .read(offlineCommentListNotifierProvider.notifier)
//         .getOfflineCommentList();
//   }
//   return;
// });
