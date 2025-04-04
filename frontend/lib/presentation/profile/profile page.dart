import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/core/providers/token_provider.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
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
                  style: AppTextTheme.semiBold25,
                ),
                Gap(30),
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
                    Text('Name:').padRight(10),
                    Text('Sridhar'),
                  ],
                )).padBottom(10),
                CustomCard(
                    child: Row(
                  children: [
                    Text('Email:').padRight(10),
                    Text('sridhar@yopail.com'),
                  ],
                )).padBottom(10),
                CustomCard(
                    child: Row(
                  children: [
                    Text('Mobile:').padRight(10),
                    Text('9879465131'),
                  ],
                )).padBottom(10),
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
                      Icon(Icons.logout_outlined).padRight(10),
                      Text('Logout'),
                    ],
                  )).padBottom(10),
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
