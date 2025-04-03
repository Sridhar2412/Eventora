import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/presentation/events/my_events_page.dart';
import 'package:flutter_master/presentation/events/provider/my_event_list_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_loader.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_master/presentation/shared/components/custom_card.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/extension/widget.dart';

class MyEventListing extends ConsumerStatefulWidget {
  const MyEventListing({super.key, required this.controller});
  final TabController controller;

  @override
  ConsumerState<MyEventListing> createState() => _MyEventListingState();
}

class _MyEventListingState extends ConsumerState<MyEventListing>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref
          .read(
            myEventListNotifierProvider(widget.controller.index).notifier,
          )
          .clearState();
      await ref
          .read(
            myEventListNotifierProvider(widget.controller.index).notifier,
          )
          .getMyEventList(userId: 1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tab = ref.watch(myEventTabProvider);
    final notifier = ref.read(myEventListNotifierProvider(tab).notifier);
    final state = ref.watch(
      myEventListNotifierProvider(widget.controller.index),
    );

    return Column(
      children: [
        const Gap(10),
        if (state.loading)
          const Expanded(child: AppLoader())
        else
          Expanded(
            child: RefreshIndicator(
              color: AppColor.primary,
              backgroundColor: AppColor.white,
              onRefresh: () async {
                ref
                    .read(
                      myEventListNotifierProvider(
                        widget.controller.index,
                      ).notifier,
                    )
                    .clearState();
                await ref
                    .read(
                      myEventListNotifierProvider(
                        widget.controller.index,
                      ).notifier,
                    )
                    .getMyEventList(userId: 1);
              },
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: (state.data.myEventList.isEmpty)
                    ? CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            child: Align(
                              child: Text(
                                'No Events Found',
                                style: AppTextTheme.label12,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.data.myEventList.length,
                        itemBuilder: (context, index) {
                          final item = state.data.myEventList[index];

                          // if (state.data.myEventList.length - 1 == index &&
                          //     state.loadMore) {
                          //   notifier.loadMore();
                          //   return const AppLoader().padVer(10);
                          // }
                          return InkWell(
                            onTap: () => context.pushRoute(EventDetailRoute(
                                eventId:
                                    state.data.myEventList[index].eventId ??
                                        0)),
                            child: CustomCard(
                                padding: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Assets.images.event.image(
                                          fit: BoxFit.fill,
                                          width: context.width,
                                          height: 180),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data.myEventList[index]
                                                  .eventName ??
                                              '',
                                          style: AppTextTheme.semiBold18,
                                        ),
                                        Text(
                                          'Date: ${changeToSimpleDMY(state.data.myEventList[index].eventDate.toString())}',
                                          style: AppTextTheme.medium14
                                              .copyWith(fontSize: 14),
                                        ),
                                        Text(
                                          state.data.myEventList[index].city ??
                                              '',
                                          style: AppTextTheme.medium14.copyWith(
                                              fontSize: 14,
                                              color: AppColor.grey),
                                        ),
                                      ],
                                    ).padAll(15),
                                  ],
                                )).padBottom(),
                          ).padHor();
                        },
                      ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
