import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/core/providers/token_provider.dart';
import 'package:flutter_master/presentation/auth/providers/profile_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_master/presentation/shared/components/custom_card.dart';
import 'package:flutter_master/presentation/shared/components/custom_dialog.dart';
import 'package:flutter_master/presentation/shared/providers/router.dart';
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
    final state = ref.read(profileNotifierProvider);
    return Scaffold(
      backgroundColor: AppColor.whiteBackground,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(40),
                Text(
                  'Profile',
                  style:
                      AppTextTheme.semiBold25.copyWith(color: AppColor.primary),
                ),
                Gap(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColor.primary,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.white,
                        child: Icon(
                          Icons.person,
                          color: AppColor.primary,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(30),
                CustomCard(
                        child: Row(
                  children: [
                    Text(
                      'Name:',
                      style: AppTextTheme.semiBold16
                          .copyWith(color: AppColor.primary),
                    ).padRight(10),
                    Text(
                      state.data.fullname ?? '',
                      style: AppTextTheme.medium14,
                    ),
                  ],
                ).padVer(7))
                    .padBottom(10),
                CustomCard(
                        child: Row(
                  children: [
                    Text(
                      'Email:',
                      style: AppTextTheme.semiBold16
                          .copyWith(color: AppColor.primary),
                    ).padRight(10),
                    Text(
                      state.data.email ?? '',
                      style: AppTextTheme.medium14,
                    ),
                  ],
                ).padVer(7))
                    .padBottom(10),
                CustomCard(
                        child: Row(
                  children: [
                    Text(
                      'Mobile:',
                      style: AppTextTheme.semiBold16
                          .copyWith(color: AppColor.primary),
                    ).padRight(10),
                    Text(
                      state.data.mobile ?? '',
                      style: AppTextTheme.medium14,
                    ),
                  ],
                ).padVer(7))
                    .padBottom(10),
                CustomCard(
                        child: Row(
                  children: [
                    Text(
                      'Role:',
                      style: AppTextTheme.semiBold16
                          .copyWith(color: AppColor.primary),
                    ).padRight(10),
                    Text(
                      state.data.role.toString(),
                      style: AppTextTheme.medium14,
                    ),
                  ],
                ).padVer(7))
                    .padBottom(10),
                CustomCard(
                        child: Row(
                  children: [
                    Text(
                      'DOB:',
                      style: AppTextTheme.semiBold16
                          .copyWith(color: AppColor.primary),
                    ).padRight(10),
                    Text(
                      changeToSimpleDMY(
                          (DateTime.tryParse(state.data.dob.toString()) ??
                                  DateTime.now())
                              .toString()),
                      style: AppTextTheme.medium14,
                    ),
                  ],
                ).padVer(7))
                    .padBottom(10),
                CustomCard(
                        child: Row(
                  children: [
                    Text(
                      'Organization:',
                      style: AppTextTheme.semiBold16
                          .copyWith(color: AppColor.primary),
                    ).padRight(10),
                    Text(
                      state.data.organization ?? '',
                      style: AppTextTheme.medium14,
                    ),
                  ],
                ).padVer(7))
                    .padBottom(10),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          title: 'Logout',
                          description: 'Are you sure you want to logout?',
                          onPositive: () async {
                            // await FirebaseMessaging.instance.deleteToken();
                            // ref.invalidate(dioInstanceProvider);
                            ref
                                .read(tokenNotifierProvider.notifier)
                                .cleanToken();
                            await ref
                                .read(routerProvider)
                                .replaceAll([const LoginRoute()]);
                          },
                          onNegative: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                  child: CustomCard(
                          child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: AppColor.primary,
                      ).padRight(10),
                      Text('Logout'),
                    ],
                  ).padVer(7))
                      .padBottom(10),
                ),
                Gap(30),
              ],
            ).padHor(),
          )
        ],
      ),
    );
  }
}
