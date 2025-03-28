import 'package:auto_route/auto_route.dart';
import 'package:flutter_master/presentation/auth/login.dart';
import 'package:flutter_master/presentation/auth/register_page.dart';
import 'package:flutter_master/presentation/home/home.dart';
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
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: MainRoute.page,
          children: [
            // AutoRoute(
            //   page: HomeRoute.page,
            // ),
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: LoginRoute.page,
            ),
            AutoRoute(
              page: LoginRoute.page,
            ),
          ],
        ),
      ];
}
