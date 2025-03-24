import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/presentation/home/providers/home_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/custom_card.dart';
import 'package:flutter_master/presentation/shared/skeleton_widget.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(homeNotifierProvider.notifier).getUser();
      await ref.read(homeNotifierProvider.notifier).getContactList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(homeNotifierProvider.notifier).getContactList();
      },
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverGap(20),
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Chats',
                    style: AppTextTheme.semiBold25,
                  ),
                ],
              ).padHor(),
            ),
            const SliverGap(25),
            (!state.loading)
                ? SliverList.builder(
                    itemCount: state.data.contactList.length,
                    itemBuilder: (context, index) {
                      final item = state.data.contactList[index];
                      return InkWell(
                        onTap: () =>
                            context.pushRoute(ChatDetailRoute(userId: item.id)),
                        child: CustomCard(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundColor: AppColor.primary,
                                    child: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: AppColor.white,
                                    ),
                                    // backgroundImage: NetworkImage(item.profileImgUrl),
                                  ).padRight(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: AppTextTheme.medium14,
                                      ),
                                      Text(
                                        item.email,
                                        style: AppTextTheme.label12
                                            .copyWith(color: AppColor.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ).padHor().pad(bottom: 10),
                      );
                    })
                : SliverList.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return SkeletonWidget(
                        height: context.heightByPercent(10),
                        width: context.width,
                      ).padHor().pad(bottom: 10);
                    }),
          ],
        ),
      ),
    );
  }
}
