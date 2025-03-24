// import 'package:flutter_master/core/providers/database_box_provider.dart';
// import 'package:flutter_master/domain/model/chat_model.dart';
// import 'package:flutter_master/presentation/offline/model/offline_transaction_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final offlineTransactionListNotifierProvider = StateNotifierProvider<
//     OfflineTransactionListNotifier, List<OfflineTransaction>>((_ref) {
//   return OfflineTransactionListNotifier(_ref);
// });

// class OfflineTransactionListNotifier
//     extends StateNotifier<List<OfflineTransaction>> {
//   OfflineTransactionListNotifier(this.ref) : super([]);

//   final Ref ref;

//   void clearTransactionxList() {
//     final boxState =
//         ref.read(databaseBoxProvider).store.box<OfflineTransaction>();
//     boxState.removeAll();
//   }

//   void addTransaction(Transaction transaction) {
//     final boxState =
//         ref.read(databaseBoxProvider).store.box<OfflineTransaction>();
//     final List<OfflineTransaction> transactions = List.from(boxState.getAll());
//     transactions.insert(
//         transactions.length,
//         OfflineTransaction(
//           ids: transaction.id,
//           // title: transaction.title,
//           product: transaction.product,
//           amount: transaction.amount,
//           isCredit: transaction.isCredit,
//           senderId: transaction.sender.id,
//           recieverId: transaction.reciever.id,
//         ));
//     boxState.removeAll();
//     state = transactions;
//     boxState.putMany(transactions);
//   }

//   // int addNewBatch(OfflineTransaction newBatch) {
//   //   final boxState = ref.read(databaseBoxProvider).store.box<OfflineTransaction>();
//   //   return boxState.put(newBatch);
//   // }

//   List<OfflineTransaction> getOfflineTransactionList() {
//     final boxState =
//         ref.read(databaseBoxProvider).store.box<OfflineTransaction>();
//     final allTransactions = boxState.removeAll();
//     final List<OfflineTransaction> response = List.from([]);
//     state = [];
//     return response;
//   }
// }
