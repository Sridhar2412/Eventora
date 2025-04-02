import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/core/utils/app_utils.dart';
import 'package:flutter_master/presentation/home/provider/events_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_master/presentation/shared/components/custom_card.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class EventListPage extends ConsumerStatefulWidget {
  const EventListPage({super.key, required this.category});
  final String category;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventListPageState();
}

class _EventListPageState extends ConsumerState<EventListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(eventNotifierProvider.notifier).getEventListByCategory(
          category: AppUtils.getCategory(widget.category));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventNotifierProvider);

    return Scaffold(
      backgroundColor: AppColor.whiteBackground,
      body: CustomScrollView(
        slivers: [
          SliverGap(40),
          SliverToBoxAdapter(
            child: Text(
              'Event List Page',
              style: AppTextTheme.semiBold20,
            ).padHor(),
          ),
          SliverGap(20),
          SliverList.builder(
              itemCount: state.data.eventByCategoryList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context.pushRoute(EventDetailRoute(
                      eventId:
                          state.data.eventByCategoryList[index].eventId ?? 0)),
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
                                state.data.eventByCategoryList[index]
                                        .eventName ??
                                    '',
                                style: AppTextTheme.semiBold18,
                              ),
                              Text(
                                'Date: ${changeToSimpleDMY(state.data.eventByCategoryList[index].eventDate.toString())}',
                                style: AppTextTheme.medium14
                                    .copyWith(fontSize: 14),
                              ),
                              Text(
                                state.data.eventByCategoryList[index].city ??
                                    '',
                                style: AppTextTheme.medium14.copyWith(
                                    fontSize: 14, color: AppColor.grey),
                              ),
                            ],
                          ).padAll(15),
                        ],
                      )).padBottom(),
                ).padHor();
              }),
          SliverGap(20),
        ],
      ),
    );
  }
}
