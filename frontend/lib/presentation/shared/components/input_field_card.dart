import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/config/app_color.dart';
import '../../theme/config/app_style.dart';

class InputFieldCard extends ConsumerWidget {
  const InputFieldCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppStyle.shadow,
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
