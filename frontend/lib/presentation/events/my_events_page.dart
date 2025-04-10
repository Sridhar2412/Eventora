import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/presentation/events/my_event_listing_page.dart';
import 'package:flutter_master/presentation/home/provider/events_notifier.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

final myEventTabProvider = StateProvider<int>((ref) {
  return 0;
});

@RoutePage()
class MyEventsPage extends ConsumerStatefulWidget {
  const MyEventsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends ConsumerState<MyEventsPage>
    with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await ref.read(eventNotifierProvider.notifier).getEventList();
  //   });
  //   super.initState();
  // }
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      ref.read(myEventTabProvider.notifier).state = _controller.index;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // if (ref.watch(isLoginProvider) == false) {
      //   final tab = ref.read(myEventTabProvider);
      //   ref.read(appointmentListNotifierProvider(tab).notifier).stopLoading();
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventNotifierProvider);
    final tab = ref.watch(myEventTabProvider);

    return Scaffold(
      backgroundColor: AppColor.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40),
          Text(
            'My Events',
            style: AppTextTheme.semiBold25.copyWith(color: AppColor.primary),
            textAlign: TextAlign.left,
          ),
          Gap(20),
          Container(
            height: 55,
            // width: 400,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _controller,
              indicatorWeight: 1,
              physics: const ClampingScrollPhysics(),
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              labelColor: AppColor.white,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              automaticIndicatorColorAdjustment: false,
              labelStyle: AppTextTheme.medium14.copyWith(color: AppColor.black),
              unselectedLabelColor: AppColor.black.withOpacity(0.6),
              tabs: List.generate(
                3,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: index == tab ? AppColor.primary : null,
                    borderRadius: index == tab
                        ? BorderRadius.circular(12)
                        : BorderRadius.zero,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.transparent,
                    ),
                  ),
                  height: context.heightByPercent(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ['Attended', 'Today', 'Upcoming'][index],
                        style: AppTextTheme.medium14.copyWith(
                          color: index == tab ? AppColor.white : AppColor.black,
                        ),
                      ).padHor(20),
                    ],
                  ),
                ),
              ),
            ).padAll(5),
          ),
          Gap(20),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                MyEventListing(controller: _controller),
                MyEventListing(controller: _controller),
                MyEventListing(controller: _controller),
              ],
            ),
          ),
        ],
      ).padHor(),
    );
  }
}
