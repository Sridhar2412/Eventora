import 'flavor.dart';

class Constants {
  Constants._({
    required this.flavor,
    required this.baseUrl,
  });

  static final Constants instance = Constants._(
    flavor: Flavor.values.firstWhere(
      (element) => element.name == const String.fromEnvironment('FLAVOR'),
    ),
    baseUrl:
        '${const String.fromEnvironment('BASE_URL')}:4000', //BASE_URL is specified in env json file
  );

  final Flavor flavor;
  final String baseUrl;

  // Auth
  static const String generateToken = 'auth/generate-token';
  static const String refreshToken = 'auth/refresh-token';

  //User
  static const String getUser = 'user';
  static const String getUserList = 'user/list';
  static const String getUserById = 'user/{id}';
  static const String saveUser = 'user/save';
  static const String login = 'user/login';

  //Chat
  static const String saveChat = 'chat/save';
  static const String getChatList = 'chat/list';
  static const String getChatListById = 'chat/list/{id}';
}
