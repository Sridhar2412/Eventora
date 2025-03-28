import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/presentation/home/provider/events_notifier.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_master/presentation/shared/components/custom_card.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventNotifierProvider);
    return Scaffold(
      backgroundColor: AppColor.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40),
          Text(
            'Upcoming Events',
            style: AppTextTheme.semiBold16,
          ).pad(bottom: 10),
          SizedBox(
            height: context.heightByPercent(20),
            width: context.width,
            child: PageView.builder(
                itemCount: state.data.eventList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CustomCard(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Event name: ${state.data.eventList[index].eventName}'),
                        Text(
                            'Date: ${changeToSimpleDMY(state.data.eventList[index].eventDate.toString())}'),
                      ],
                    )).padRight()),
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
                itemCount: 5,
                controller: PageController(
                  viewportFraction: 0.33,
                ),
                scrollDirection: Axis.horizontal,
                padEnds: false,
                itemBuilder: (context, index) => CustomCard(
                        child: Column(
                      children: [Text('Category ${index + 1}')],
                    )).padRight()),
          ),
          Gap(20),
          Text(
            'Recomendations',
            style: AppTextTheme.semiBold16,
          ).pad(bottom: 10),
          SizedBox(
            height: context.heightByPercent(20),
            width: context.width,
            child: PageView.builder(
                itemCount: state.data.upcomingEventList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CustomCard(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Event name: ${state.data.upcomingEventList[index].eventName}'),
                        Text(
                            'Date: ${changeToSimpleDMY(state.data.upcomingEventList[index].eventDate.toString())}'),
                      ],
                    )).padRight()),
          ),
          Gap(20),
          Gap(40),
        ],
      ).padAll(15),
    );
  }
}
