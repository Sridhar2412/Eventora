import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/shared/components/app_loader.dart';
import 'package:gap/gap.dart';

import '../../../../core/extension/context.dart';
import '../../../../core/extension/widget.dart';
import '../../theme/config/app_color.dart';
import '../gen/assets.gen.dart';
import 'app_text_theme.dart';
import 'custom_filled_button.dart';

class AddDialogWidget extends StatelessWidget {
  const AddDialogWidget({
    super.key,
    this.title,
    required this.widgetBlock,
    this.onSubmit,
    this.onSubmited,
    this.height,
    this.loading,
    this.onCancel,
    this.submitText,
  });
  final String? title;
  final Widget widgetBlock;
  final VoidCallback? onSubmit;
  final VoidCallback? onSubmited;
  final VoidCallback? onCancel;
  final double? height;
  final bool? loading;
  final String? submitText;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      shape: const StadiumBorder(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: onCancel ??
                        () {
                          context.popRoute();
                        },
                    child: Assets.svg.cancel
                        .svg(color: AppColor.white, height: 30),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1C000000),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    if (title != null)
                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        color: AppColor.white,
                        child: Text(
                          title ?? '',
                          style: AppTextTheme.semiBold20
                              .copyWith(color: AppColor.primary),
                        ),
                      ),
                    const Gap(5),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: height ?? context.heightByPercent(80),
                      ),
                      child: ListView(
                        // physics: const NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        children: [
                          const Gap(10),
                          SizedBox(
                            child: widgetBlock,
                          ),
                          const Gap(10),
                          if (onSubmited != null)
                            Row(
                              children: [
                                Row(
                                  children: [
                                    CustomFilledButton(
                                      radius: 10,
                                      size: const Size(150, 50),
                                      title: 'Submit',
                                      onTap: onSubmited,
                                      // style: AppTextTheme.label13
                                      //     .copyWith(color: AppColor.white),
                                      color: AppColor.primary,
                                    ),
                                    const Gap(20),
                                    CustomFilledButton(
                                      radius: 10,
                                      size: const Size(150, 50),
                                      title: 'Cancel',
                                      textColor: AppColor.black,
                                      onTap: () => context.popRoute(),
                                      // style: AppTextTheme.label13
                                      //     .copyWith(color: AppColor.white),
                                      color: AppColor.white,
                                    ),
                                  ],
                                ).padAll(10),
                                const SizedBox(),
                              ],
                            ).padHor(),
                        ],
                      ),
                    ),
                    const Gap(5),
                    if (onSubmit != null)
                      (loading ?? false)
                          ? ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                fixedSize: const Size.fromHeight(50),
                              ),
                              child: const AppLoader(),
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: CustomFilledButton(
                                    title: submitText ?? 'Submit',
                                    onTap: onSubmit,
                                    // style: AppTextTheme.label13
                                    //     .copyWith(color: AppColor.white),
                                    color: AppColor.primary,
                                  ),
                                ),
                              ],
                            ).padAll(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
