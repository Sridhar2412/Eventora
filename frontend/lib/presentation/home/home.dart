import 'package:api/api.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/presentation/home/provider/events_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_master/presentation/shared/components/custom_card.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_master/presentation/shared/providers/predefined_list_noftifier.dart';
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(eventNotifierProvider.notifier).getEventList();
      await ref.read(eventNotifierProvider.notifier).getUpcomingEventList();
      await ref.read(predefinedListNotifierProvider.notifier).getPredefinedList(
          entityType: PredefinedListRequestEntityTypeEnum.EVENT_CATEGORY);
    });
  }

  List<String> categoiryColorList = [
    "FF6F61", // Social (Soft coral, vibrant and engaging)
    "4CAF50", // Sports (Lively green, fresh and energetic)
    "00BCD4", // Travel (Refreshing teal, representing the open sky and ocean)
    "3F51B5", // Business (Sophisticated indigo, professional and reliable)
    "FF4081", // Tech (Bright pinkish-red, modern and dynamic)
    "FF9800", // Community (Warm amber, inviting and social)
    "9C27B0", // Games (Playful purple, creative and fun)
    "FFEB3B", // Dancing (Bright yellow, energetic and lively)
    "2196F3", // Music (Vibrant blue, soothing yet energetic)
    "673AB7", // Art (Creative purple, artistic and expressive)
    "4CAF50", // Education (Refreshing green, symbolizes growth and learning)
    "F44336" // Political (Bold red, strong and impactful)
  ];
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventNotifierProvider);
    final predefinedState = ref.watch(predefinedListNotifierProvider);
    return Scaffold(
      backgroundColor: AppColor.whiteBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            Text(
              'Upcoming Events',
              style: AppTextTheme.semiBold16,
            ).pad(bottom: 10),
            SizedBox(
              height: 280,
              width: context.width,
              child: PageView.builder(
                  // itemCount: 5,
                  itemCount: state.data.upcomingEventList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => context.pushRoute(EventDetailRoute(
                            eventId:
                                state.data.upcomingEventList[index].eventId ??
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.data.upcomingEventList[index]
                                              .eventName ??
                                          '',
                                      style: AppTextTheme.semiBold18,
                                    ),
                                    Text(
                                      'Date: ${changeToSimpleDMY(state.data.upcomingEventList[index].eventDate.toString())}',
                                      style: AppTextTheme.medium14
                                          .copyWith(fontSize: 14),
                                    ),
                                    Text(
                                      state.data.upcomingEventList[index]
                                              .city ??
                                          '',
                                      style: AppTextTheme.medium14.copyWith(
                                          fontSize: 14, color: AppColor.grey),
                                    ),
                                  ],
                                ).padAll(15),
                              ],
                            )).padRight(),
                      )),
            ),
            Gap(20),
            Text(
              'Categories',
              style: AppTextTheme.semiBold16,
            ).pad(bottom: 10),
            SizedBox(
              height: context.heightByPercent(20),
              width: context.width,
              child: PageView.builder(
                  itemCount: predefinedState.data.categoryList.length,
                  controller: PageController(
                    viewportFraction: 0.33,
                  ),
                  scrollDirection: Axis.horizontal,
                  padEnds: false,
                  itemBuilder: (context, index) => CustomCard(
                      backgroundColor:
                          Color(int.parse('0xFF${categoiryColorList[index]}')),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            predefinedState.data.categoryList[index].name ?? '',
                            style: AppTextTheme.semiBold14
                                .copyWith(color: AppColor.white),
                          )
                        ],
                      )).padRight()),
            ),
            Gap(20),
            Text(
              'Recomendations',
              style: AppTextTheme.semiBold16,
            ).pad(bottom: 10),
            SizedBox(
              height: 280,
              width: context.width,
              child: PageView.builder(
                  // itemCount: 5,
                  itemCount: state.data.eventList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => context.pushRoute(EventDetailRoute(
                            eventId:
                                state.data.upcomingEventList[index].eventId ??
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
                                      height: 180,
                                      width: context.width),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.data.eventList[index].eventName ??
                                          '',
                                      style: AppTextTheme.semiBold18,
                                    ),
                                    Text(
                                      'Date: ${changeToSimpleDMY(state.data.eventList[index].eventDate.toString())}',
                                      style: AppTextTheme.medium14
                                          .copyWith(fontSize: 14),
                                    ),
                                    Text(
                                      state.data.eventList[index].city ?? '',
                                      style: AppTextTheme.medium14.copyWith(
                                          fontSize: 14, color: AppColor.grey),
                                    ),
                                  ],
                                ).padAll(15),
                              ],
                            )).padRight(),
                      )),
            ),
            Gap(20),
            Gap(40),
          ],
        ).padAll(15),
      ),
    );
  }
}
