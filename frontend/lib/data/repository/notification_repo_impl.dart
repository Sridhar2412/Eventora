// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../domain/repository/notification_repo.dart';
// import '../source/remote/notification_source.dart';

// part 'notification_repo_impl.g.dart';

// @riverpod
// NotificationRepoImpl notificationRepo(NotificationRepoRef ref) {
//   return NotificationRepoImpl(ref.watch(notificationSourceProvider));
// }

// class NotificationRepoImpl implements NotificationRepository {
//   NotificationRepoImpl(this._source);

//   final NotificationSource _source;

//   // @override
//   // Future<Either<AppException, List<Notification>>> getNotification(
//   //   int pageNumber,
//   //   int pageSize,
//   //   int userId,
//   // ) async {
//   //   final body = {
//   //     'isDelete': 'N',
//   //     'isDeactive': 'N',
//   //     'pageSize': pageSize,
//   //     'pageNumber': pageNumber,
//   //     'type': 'NOTIFICATION',
//   //     'parentUserId': userId,
//   //     'orderBy': 'DESC',
//   //     'oredrByFeild': 'createdDate',
//   //   };
//   //   log(jsonEncode(body));
//   //   return _source.getNotification(body).guardFuture();
//   // }

//   @override
//   Future<String?> getFirebaseToken() {
//     return FirebaseMessaging.instance.getToken();
//   }

//   @override
//   Stream<RemoteMessage> get onBackgroundPushNotification =>
//       FirebaseMessaging.onMessageOpenedApp;

//   @override
//   Stream<RemoteMessage> get onForegroundPushNotification =>
//       FirebaseMessaging.onMessage;

//   @override
//   Stream<String> get onTokenExpired =>
//       FirebaseMessaging.instance.onTokenRefresh;

//   @override
//   Future<void> saveFirebaseToken({
//     required int userId,
//     required String token,
//     required String deviceType,
//   }) {
//     final body = {
//       'userId': 2,
//       // 'userId': userId,
//       'firebaseToken': token,
//       'deviceType': deviceType,
//       'deviceId': '1234',
//     };
//     // final body = {
//     //   'userId': 20,
//     //   'firebaseToken': 'XML',
//     //   'deviceType': 'ANDROID',
//     //   'deviceId': 'XYZ',
//     // };

//     return _source.updateFirebaseToken(body: body);
//   }

//   // @override
//   // Future<Either<AppException, NotificationReadCountRes>>
//   //     getNotificationUnreadCount(int userId) {
//   //   return _source.getNotificationUnreadCount(id: userId).guardFuture();
//   // }

//   // @override
//   // Future<Either<AppException, OtpRes>> updateNotificationUnread(int userId) {
//   //   return _source.updateNotificationRead(id: userId).guardFuture();
//   // }
// }
