// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/home/providers/home_notifier.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_master/presentation/theme/config/app_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/extension/widget.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(homeNotifierProvider);
    return Scaffold(
      backgroundColor: AppColor.whiteBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverGap(20),
            SliverToBoxAdapter(
              child: Text(
                'Notification',
                style: AppTextTheme.semiBold18,
              ).padHor(),
            ),
            const SliverGap(30),
            SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: AppStyle.shadow,
                      color: AppColor.white,
                      border: Border.all(
                        color: AppColor.white.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColor.primary,
                            child:
                                Assets.icons.logo.image(height: 20, width: 20),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title', style: AppTextTheme.semiBold14),
                              Text(
                                ('Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum'
                                            .length >
                                        70)
                                    ? '${'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum'.substring(0, 70)}...'
                                    : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum',
                                style: AppTextTheme.label12
                                    .copyWith(color: AppColor.grey),
                                // overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '23/12/2023',
                                // (widget.createdDate != '')
                                //     ? changeToSimpleDMY(widget.createdDate)
                                //     : '',
                                style: AppTextTheme.label12,
                              ),
                              Text(
                                '2:45 PM',
                                // (widget.createdDate != '')
                                //     ? changeToSimpleDMY(widget.createdDate)
                                //     : '',
                                style: AppTextTheme.label12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).padAll(10),
                  ).pad(left: 20, right: 20, bottom: 20);
                })
          ],
        ),
      ),
    );
  }
}
