// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/presentation/home/components/profile_tile_data_component.dart';
import 'package:flutter_master/presentation/home/providers/home_notifier.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/extension/widget.dart';

@RoutePage()
class PersonalInfoPage extends ConsumerStatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  ConsumerState<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends ConsumerState<PersonalInfoPage> {
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
                'Personal Info Page',
                style: AppTextTheme.semiBold18,
              ).padHor(),
            ),
            SliverGap(context.heightByPercent(5)),
            // SliverToBoxAdapter(
            //   child: Text(
            //     'Personal Info',
            //     style: AppTextTheme.semiBold14,
            //   ).padHor(),
            // ),
            // SliverToBoxAdapter(
            //   child: Divider(
            //     height: 0,
            //     color: AppColor.black.withOpacity(0.3),
            //   ).padVer().padHor(),
            // ),
            SliverToBoxAdapter(
              child: ProfileTileDataComponent(
                title: 'Name',
                description: userState.data.name,
                prefixIcon: const Icon(Icons.person_2_outlined),
              ).padLeft(),
            ),
            const SliverGap(20),
            SliverToBoxAdapter(
              child: ProfileTileDataComponent(
                title: 'Email',
                description: userState.data.email,
                prefixIcon: Assets.svg.email.svg(height: 25, width: 25),
              ).padLeft(20),
            ),
            const SliverGap(20),
            SliverToBoxAdapter(
              child: ProfileTileDataComponent(
                title: 'Balance',
                description: 'Rs ${userState.data.balance.toString()}',
                prefixIcon: const Icon(Icons.payments),
              ).padLeft(20),
            ),
            const SliverGap(20),
            SliverToBoxAdapter(
              child: ProfileTileDataComponent(
                title: 'Days Left',
                description: '${userState.data.daysLeft.toInt()} days',
                prefixIcon: const Icon(Icons.calendar_month),
              ).padLeft(20),
            ),
            const SliverGap(20),
          ],
        ),
      ),
    );
  }
}
