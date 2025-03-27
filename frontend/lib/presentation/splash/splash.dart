import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/providers/token_provider.dart';
import 'package:flutter_master/data/source/local/shar_pref.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/extension/context.dart';
import '../routes/app_router.dart';
import '../shared/providers/router.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    navigate();
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Stack(
        children: [
          Center(
            child: Container(
              color: AppColor.primary,
              height: context.height,
              width: context.width,
            ),
          ),
          const Positioned(
            child: Center(
              child: Placeholder(),
            ),
          ),
        ],
      ),
      // ),
    );
  }

  Future<void> navigate() async {
    final router = ref.read(routerProvider);
    final token = await ref.read(sharedPrefProvider).getToken();
    if (token == null) {
      ref.read(routerProvider).replace(const LoginRoute());
      return;
    }
    _timer = Timer(
      const Duration(seconds: 2),
      () async {
        final token = await ref.read(sharedPrefProvider).getToken();
        if (token != null) {
          await ref.read(tokenNotifierProvider.notifier).updateToken(token);
          await Future.delayed(const Duration(seconds: 1));
          await router.replaceAll([const MainRoute()]);
        }
      },
    );
  }
}
