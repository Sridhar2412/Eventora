import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../theme/config/app_color.dart';
import 'app_text_theme.dart';
import 'elevated_container.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.description,
    this.onPositive,
    this.onNegative,
  }) : super(key: key);
  final String title;
  final String description;
  final VoidCallback? onPositive;
  final VoidCallback? onNegative;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shadowColor: AppColor.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: ElevatedContainer(
        color: AppColor.white,
        height: 160,
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: AppTextTheme.semiBold16,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  description,
                  style: AppTextTheme.medium14,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.popRoute();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.primary.withOpacity(0.5),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(6)),
                      ),
                      child: Center(
                        child: Text(
                          'CANCEL',
                          style: AppTextTheme.semiBold14.copyWith(
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: onPositive,
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'CONFIRM',
                          style: AppTextTheme.semiBold14.copyWith(
                            color: Colors.white,
                            letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
