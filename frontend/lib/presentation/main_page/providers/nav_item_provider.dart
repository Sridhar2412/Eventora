import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navItemsProvider = Provider<List<NavData>>((ref) {
  return [
    NavData(
        label: 'Home',
        activeIcon: const Icon(
          Icons.home_outlined,
          color: AppColor.primary,
        ),
        inactiveIcon: const Icon(
          Icons.home_outlined,
          color: AppColor.grey,
        )),
    NavData(
        label: 'My Events',
        activeIcon: const Icon(
          Icons.event_outlined,
          color: AppColor.primary,
        ),
        inactiveIcon: const Icon(
          Icons.event_outlined,
          color: AppColor.grey,
        )),
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
        label: 'Profile',
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
