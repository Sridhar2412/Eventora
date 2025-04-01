import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/theme/config/app_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extension/context.dart';
import '../../../core/extension/widget.dart';
import '../../theme/config/app_color.dart';

class CustomCard extends ConsumerWidget {
  const CustomCard(
      {super.key, required this.child, this.padding, this.backgroundColor});
  final Widget child;
  final double? padding;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.white,
        boxShadow: AppStyle.shadow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child.padAll(padding ?? 10),
    );
  }
}
