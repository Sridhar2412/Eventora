import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/data/source/local/shar_pref.dart';
import 'package:flutter_master/presentation/home/providers/home_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // ref.read(internetSwitchHomeProvider);

    final state = ref.watch(homeNotifierProvider);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppColor.whiteBackground,
              child: Column(
                children: [
                  const Gap(20),
                  Row(
                    children: [
                      const Expanded(flex: 3, child: SizedBox()),
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              const CircleAvatar(
                                radius: 55,
                                backgroundColor: AppColor.white,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: AppColor.primary,
                                  child: Icon(
                                    Icons.person,
                                    color: AppColor.white,
                                    size: 50,
                                  ),
                                  // backgroundImage:
                                  //     NetworkImage(state.data.profileImgUrl),
                                ),
                              ),
                              Text(
                                state.data.name,
                                style: AppTextTheme.semiBold16,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state.data.email,
                                style: AppTextTheme.medium12,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  ref.read(sharedPrefProvider).clearAll();
                                  context.replaceRoute(const LoginRoute());
                                },
                                child: Text(
                                  'Logout',
                                  style: AppTextTheme.medium14
                                      .copyWith(color: AppColor.primary),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                height: context.heightByPercent(12),
                              )
                            ],
                          )),
                    ],
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
          const SliverGap(20),
          SliverToBoxAdapter(
            child: Column(
              children: [
                InkWell(
                  onTap: () => context.pushRoute(const PersonalInfoRoute()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            color: AppColor.grey,
                            size: 30,
                          ).padRight(10),
                          Text(
                            'Personal Info',
                            style: AppTextTheme.semiBold16,
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.primary,
                        size: 18,
                      )
                    ],
                  ),
                ),
                const Divider().padVer(10),
                InkWell(
                  onTap: () => context.pushRoute(const NotificationRoute()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.notifications,
                            color: AppColor.grey,
                            size: 30,
                          ).padRight(10),
                          Text(
                            'Notifications',
                            style: AppTextTheme.semiBold16,
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.primary,
                        size: 18,
                      )
                    ],
                  ),
                ),
                const Divider().padVer(10),
              ],
            ).padHor(),
          ),
          const SliverGap(20),
        ],
      )),
    );
  }
}
