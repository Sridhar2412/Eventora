import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/presentation/events/my_event_listing_page.dart';
import 'package:flutter_master/presentation/home/provider/events_notifier.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

final myEventTabProvider = StateProvider<int>((ref) {
  return -1;
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

    return Scaffold(
      backgroundColor: AppColor.whiteBackground,
      body: Column(
        children: [
          Container(
            width: context.width,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            color: AppColor.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(50),
                Text(
                  'My Events',
                  style:
                      AppTextTheme.semiBold16.copyWith(color: AppColor.white),
                ),
                const Gap(10),
                // Row(
                //   children: [
                //     Expanded(
                //       flex: 10,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: AppColor.primary,
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         height: 40,
                //         child: Row(
                //           children: [
                //             const Gap(10),
                //             Icon(
                //               Icons.search,
                //               color: AppColor.primary,
                //             ),
                //             Expanded(
                //               child: TextFormField(
                //                 controller: TextEditingController(),
                //                 // controller: notifier.searchTxtController,
                //                 style: AppTextTheme.semiBold14
                //                     .copyWith(color: AppColor.white),
                //                 onChanged: (data) {
                //                   if (data.isEmpty) {
                //                     FocusManager.instance.primaryFocus
                //                         ?.unfocus();
                //                   }
                //                 },
                //                 decoration: InputDecoration(
                //                   contentPadding: const EdgeInsets.only(
                //                     bottom: 7,
                //                     left: 10,
                //                   ),
                //                   border: InputBorder.none,
                //                   hintText: 'Search',
                //                   hintStyle: AppTextTheme.semiBold14.copyWith(
                //                     color: AppColor.white.withOpacity(0.5),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     const Gap(10),
                //     // Expanded(
                //     //   flex: 2,
                //     //   child: InkWell(
                //     //     onTap: () async {
                //     //       final now = DateTime.now();

                //     //       final selectedDate = await showDateRangePicker(
                //     //         builder: (context, child) {
                //     //           return Theme(
                //     //             data: ThemeData(
                //     //               inputDecorationTheme:
                //     //                   InputDecorationTheme(
                //     //                 labelStyle: AppTextTheme.base,
                //     //                 // Input label
                //     //               ),
                //     //               textTheme: TextTheme(
                //     //                 bodySmall: GoogleFonts.openSans(),
                //     //               ),
                //     //               dialogBackgroundColor: AppColor.red,
                //     //               textButtonTheme: TextButtonThemeData(
                //     //                 style: TextButton.styleFrom(
                //     //                   backgroundColor:
                //     //                       AppColor.primary.withOpacity(0.6),

                //     //                   disabledBackgroundColor:
                //     //                       AppColor.white,

                //     //                   // button text color
                //     //                 ),
                //     //               ),
                //     //               textSelectionTheme:
                //     //                   const TextSelectionThemeData(
                //     //                 selectionColor: AppColor.white,
                //     //               ),
                //     //               colorScheme: ColorScheme(
                //     //                 onSurface: AppColor
                //     //                     .primary, // This is the primary theme
                //     //                 onPrimary: AppColor
                //     //                     .white, // THis changes the selected date ka font color
                //     //                 secondary: AppColor.primary.withOpacity(
                //     //                   0.5,
                //     //                 ), // This gives the color to the range container
                //     //                 brightness: Brightness.light,
                //     //                 primary: AppColor.primary,

                //     //                 background:
                //     //                     AppColor.primary.withOpacity(0.8),
                //     //                 onError: AppColor.red,
                //     //                 error: AppColor.red,

                //     //                 onSecondary: AppColor.black,

                //     //                 surface: AppColor.primaryLight,

                //     //                 onBackground: AppColor.primaryLight,
                //     //               ).copyWith(
                //     //                 background: AppColor.primaryLight,
                //     //               ),
                //     //             ),
                //     //             child: Center(
                //     //               child: ClipRRect(
                //     //                 borderRadius: BorderRadius.circular(10),
                //     //                 child: SizedBox(
                //     //                   height: context.heightByPercent(60),
                //     //                   child: child,
                //     //                 ),
                //     //               ),
                //     //             ).padHor(),
                //     //           );
                //     //         },
                //     //         initialEntryMode:
                //     //             DatePickerEntryMode.calendarOnly,
                //     //         context: context,
                //     //         saveText: 'Submit',
                //     //         firstDate: DateTime(2000),
                //     //         currentDate: now,
                //     //         lastDate: DateTime(now.year + 5),
                //     //         keyboardType: TextInputType.none,
                //     //       );

                //     //       if (selectedDate != null) {
                //     //         ref
                //     //             .read(
                //     //               appointmentListNotifierProvider(
                //     //                 _controller.index,
                //     //               ).notifier,
                //     //             )
                //     //             .updateDateFilter(
                //     //               selectedDate.start,
                //     //               selectedDate.end,
                //     //             );
                //     //       }
                //     //     },
                //     //     child: AppointmentFilterWrapper(
                //     //       showShadow: false,
                //     //       backGroundColor: AppColor.primary,
                //     //       showClearIcon:
                //     //           state.data.filter.startDate != '' &&
                //     //               state.data.filter.endDate != '',
                //     //       clearFilterAction: () {
                //     //         notifier.clearDateFilter();
                //     //       },
                //     //       widgetComponent: Container(
                //     //         width: 40,
                //     //         height: 0,
                //     //         decoration: BoxDecoration(
                //     //           color: AppColor.orange,
                //     //           borderRadius: BorderRadius.circular(11),
                //     //         ),
                //     //         child: Assets.svg.calendar
                //     //             .svg(color: AppColor.white)
                //     //             .padAll(5),
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),

                TabBar(
                  controller: _controller,
                  indicatorWeight: 3,
                  isScrollable: true,
                  dividerHeight: 0,
                  tabAlignment: TabAlignment.center,
                  labelPadding: const EdgeInsets.only(left: 10, right: 20),
                  labelColor: AppColor.white,
                  indicatorColor: AppColor.white,
                  dividerColor: AppColor.white,
                  labelStyle:
                      AppTextTheme.label12.copyWith(color: AppColor.grey),
                  unselectedLabelColor: AppColor.white.withOpacity(0.6),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Attended',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Today',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Upcoming',
                      ),
                    ),
                    // Tab(
                    //   child: Text(
                    //     'Completed',
                    //   ),
                    // ),
                    // Tab(
                    //   child: Text(
                    //     'Cancelled',
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                MyEventListing(controller: _controller),
                MyEventListing(controller: _controller),
                MyEventListing(controller: _controller),
                // AppointmentListing(controller: _controller),
                // AppointmentListing(controller: _controller),
                // AppointmentListing(controller: _controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
