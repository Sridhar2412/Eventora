import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/extension/widget.dart';
import '../../shared/components/app_text_theme.dart';
import '../../theme/config/app_color.dart';

class ProfileTileDataComponent extends StatelessWidget {
  const ProfileTileDataComponent({
    super.key,
    required this.title,
    this.description,
    this.tagColor,
    this.descriptionColor,
    this.descriptionWidget,
    this.tagTitle,
    this.style,
    this.prefixIcon,
    this.titleColor,
    this.titleBold,
  });
  final String title;
  final String? description;
  final Widget? descriptionWidget;
  final String? tagTitle;
  final Color? tagColor;
  final Color? titleColor;
  final bool? titleBold;
  final Color? descriptionColor;
  final TextStyle? style;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) prefixIcon!.padRight(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: style ??
                          AppTextTheme.label12.copyWith(
                            color: titleColor,
                            fontWeight:
                                titleBold == true ? FontWeight.bold : null,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const Gap(6),
                    if (tagTitle != null)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: tagColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          tagTitle ?? '',
                          style: AppTextTheme.semiBold.copyWith(
                            fontSize: 11,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
                const Gap(3),
                if (description != null)
                  Text(
                    description ?? '',
                    style: AppTextTheme.label14.copyWith(
                      fontWeight: FontWeight.bold,
                      color: descriptionColor ?? AppColor.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                if (descriptionWidget != null)
                  descriptionWidget ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
