import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/extension/context.dart';
import '../../theme/config/app_color.dart';
import '../gen/assets.gen.dart';
import '../providers/router.dart';
import 'app_text_theme.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.titleWidget,
    this.onTap,
    this.bottom,
    this.backgroundColor,
    this.leadingWidth,
  });

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final Function()? onTap;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final canPop = router.canPop();
    return AppBar(
      bottom: bottom,
      leading: Row(
        children: [
          const Gap(10),
          leading ??
              GestureDetector(
                onTap: onTap ??
                    () {
                      context.popRoute();
                    },
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Assets.svg.backArrowWhite
                      .svg(color: AppColor.white, width: 20),
                ),
              ),
        ],
      ),
      title: Text(
        title,
        style: AppTextTheme.semiBold20,
      ),
      leadingWidth: leadingWidth ?? 70,
      automaticallyImplyLeading: false,
      titleSpacing: canPop ? 0 : null,
      backgroundColor: backgroundColor ?? AppColor.white,
      elevation: 0,
      actions: actions,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
