import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navItemsProvider = Provider<List<NavData>>((ref) {
  return [
    NavData(
        label: 'Dashboard',
        activeIcon: const Icon(
          Icons.dashboard,
          color: AppColor.primary,
        ),
        inactiveIcon: const Icon(
          Icons.dashboard,
          color: AppColor.grey,
        )),
    // NavData(
    //     label: 'Scan Receipt',
    //     activeIcon: const Icon(
    //       Icons.qr_code_scanner,
    //       color: AppColor.primary,
    //     ),
    //     inactiveIcon: const Icon(
    //       Icons.qr_code_scanner,
    //       color: AppColor.grey,
    //     )),

    NavData(
        label: 'Explore',
        activeIcon: const Icon(
          Icons.explore_outlined,
          color: AppColor.primary,
        ),
        inactiveIcon: const Icon(
          Icons.explore_outlined,
          color: AppColor.grey,
        )),
    NavData(
        label: 'Settings',
        activeIcon: const Icon(
          Icons.person,
          color: AppColor.primary,
        ),
        inactiveIcon: const Icon(
          Icons.person,
          color: AppColor.grey,
        )),
  ];
});

class NavData {
  NavData({
    required this.activeIcon,
    required this.label,
    required this.inactiveIcon,
  });
  final Widget activeIcon;
  final Widget inactiveIcon;
  final String label;
}
