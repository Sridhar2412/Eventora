import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../shared/components/app_text_theme.dart';
import '../../theme/config/app_color.dart';
import '../providers/nav_item_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    required this.selected,
    required this.onTabChanged,
  });
  final int selected;
  final void Function(int index) onTabChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(navItemsProvider);

    return Container(
      height: kBottomNavigationBarHeight,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -0.2),
            color: AppColor.grey,
          )
        ],
        color: AppColor.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final nav = items[index];
          final active = selected == index;
          return Expanded(
            child: InkWell(
              onTap: () => onTabChanged(index),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: active ? nav.activeIcon : nav.inactiveIcon,
                  ),
                  const Gap(5),
                  Text(
                    nav.label,
                    style: AppTextTheme.label.copyWith(
                      color: active ? AppColor.primary : AppColor.lightGrey,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
