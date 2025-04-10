import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/shared/providers/router.dart';
import 'presentation/theme/config/app_theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router.config(),
      builder: (context, child) {
        return SafeArea(
          top: false,
          child: child!,
        );
      },
      title: 'Eventora',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
