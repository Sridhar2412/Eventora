import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropDown<T> extends ConsumerWidget {
  const CustomDropDown({
    super.key,
    required this.onChanged,
    required this.items,
    this.selected,
    required this.title,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.selectedItemHeight,
    this.noBorder,
    this.contentPadding,
    this.style,
  });

  final void Function(T? item) onChanged;
  final String Function(T item) title;
  final List<T> items;
  final T? selected;
  final String? Function(T?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? selectedItemHeight;
  final bool? noBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        value: selected,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        iconSize: selectedItemHeight ?? 0,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 24,
          color: AppColor.grey,
        ),
        style: style ?? AppTextTheme.medium14,
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            hintText ?? '',
            style: AppTextTheme.medium14.copyWith(
              color: AppColor.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        decoration: InputDecoration(
          hintStyle: hintStyle ??
              AppTextTheme.medium14.copyWith(
                color: AppColor.black,
                overflow: TextOverflow.ellipsis,
              ),
          border: InputBorder.none,
          errorStyle: AppTextTheme.medium12.copyWith(color: AppColor.red),
          contentPadding:
              contentPadding ?? const EdgeInsets.symmetric(horizontal: 15),
          focusedBorder: noBorder ?? false
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColor.grey,
                  ),
                ),
          enabledBorder: noBorder ?? false
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColor.grey,
                  ),
                ),
          errorBorder: noBorder ?? false
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.red),
                ),
          focusedErrorBorder: noBorder ?? false
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColor.grey,
                  ),
                ),
        ),
        items: List.generate(
          items.length,
          (index) {
            final current = items[index];
            return DropdownMenuItem<T>(
              value: current,
              child: Text(
                title(current),
                style: style ??
                    AppTextTheme.medium14.copyWith(color: AppColor.black),
                overflow: TextOverflow.clip,
              ),
            );
          },
        ),
        onChanged: onChanged,
      ),
    );
  }
}
