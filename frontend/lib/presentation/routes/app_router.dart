import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_master/presentation/auth/login.dart';
import 'package:flutter_master/presentation/auth/register_page.dart';
import 'package:flutter_master/presentation/chat/chat_detail%20page.dart';
import 'package:flutter_master/presentation/contacts/contacts_page.dart';
import 'package:flutter_master/presentation/home/components/personal_info_page.dart';
import 'package:flutter_master/presentation/home/home.dart';
import 'package:flutter_master/presentation/home/notification_page.dart';
import 'package:flutter_master/presentation/home/profile_page.dart';
import 'package:flutter_master/presentation/main_page/main_page.dart';
import 'package:flutter_master/presentation/splash/splash.dart';
import 'package:flutter_master/presentation/theme/theme_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter(this._ref);

  final Ref _ref;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: PersonalInfoRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: NotificationRoute.page,
        ),
        AutoRoute(
          page: ChatDetailRoute.page,
        ),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: ContactsRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
      ];
}
