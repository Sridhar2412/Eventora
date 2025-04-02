import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/presentation/home/provider/events_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_master/presentation/shared/components/custom_app_bar.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class EventDetailPage extends ConsumerStatefulWidget {
  EventDetailPage({super.key, required this.eventId});
  final int eventId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(eventNotifierProvider.notifier)
          .getEventById(eventId: widget.eventId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventNotifierProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Event Detail Page',
        backgroundColor: AppColor.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Assets.images.event
                .image(fit: BoxFit.fill, width: context.width, height: 250),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.data.myEvent?.eventName ?? '',
                style: AppTextTheme.semiBold20.copyWith(fontSize: 22),
              ).padBottom(7),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.primary),
                child: Text(
                  state.data.myEvent?.category ?? '',
                  style:
                      AppTextTheme.semiBold14.copyWith(color: AppColor.white),
                ).padHor(10).padVer(7),
              ).padBottom(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: AppColor.primary,
                  ).padRight(10),
                  Text(
                    changeToSimpleDMY(
                        state.data.myEvent?.eventDate.toString() ?? ''),
                    style: AppTextTheme.medium14,
                    textAlign: TextAlign.center,
                  ),
                ],
              ).padBottom(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 25,
                    color: AppColor.primary,
                  ).padRight(10),
                  Text(
                    state.data.myEvent?.city.toString() ?? '',
                    style: AppTextTheme.medium14,
                    textAlign: TextAlign.center,
                  ),
                ],
              ).padBottom(),
              Text(
                'Details',
                style: AppTextTheme.semiBold20,
              ).padBottom(10),
              Text(
                state.data.myEvent?.description ?? '',
                style: AppTextTheme.medium14,
              ).padBottom(),
              InkWell(
                onTap: () => context.pushRoute(ViewOnMapRoute(
                  location: state.data.myEvent?.city ?? '',
                  lat: double.tryParse(state.data.myEvent?.latitude ?? '') ?? 0,
                  lang:
                      double.tryParse(state.data.myEvent?.longitude ?? '') ?? 0,
                  // lang: 19.114303,
                  // lat: 72.867943,
                  //  Position(72.867943, 19.114303)
                )),
                child: Container(
                    height: 60,
                    width: context.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 25,
                          color: AppColor.primary,
                        ).padRight(10),
                        Text(
                          'View On Map',
                          style: AppTextTheme.medium14
                              .copyWith(color: AppColor.primary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              )
            ],
          ).padHor(),
          Gap(20)
        ],
      ),
    );
  }
}
