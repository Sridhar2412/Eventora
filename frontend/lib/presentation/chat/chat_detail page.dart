import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/context.dart';
import 'package:flutter_master/core/extension/widget.dart';
import 'package:flutter_master/presentation/chat/providers/chat_notifier.dart';
import 'package:flutter_master/presentation/home/providers/home_notifier.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_master/presentation/shared/gen/assets.gen.dart';
import 'package:flutter_master/presentation/shared/skeleton_widget.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_master/presentation/theme/config/app_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ChatDetailPage extends ConsumerStatefulWidget {
  const ChatDetailPage({super.key, required this.userId});
  final int userId;
  @override
  ConsumerState<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends ConsumerState<ChatDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(chatNotifierProvider.notifier)
          .getChatListById(widget.userId);
      await ref.read(homeNotifierProvider.notifier).getContactList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(chatNotifierProvider.notifier);
    final conatactList = ref.watch(homeNotifierProvider).data.contactList;
    return WillPopScope(
      onWillPop: () async {
        ref.read(homeNotifierProvider.notifier).clearChats();
        return true;
      },
      child: Scaffold(
          backgroundColor: AppColor.whiteBackground,
          bottomNavigationBar: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          controller: notifier.messageCtrl,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final data = await notifier.saveChat(
                                conatactList.firstWhere(
                                    (element) => element.id == widget.userId));
                          },
                          child: const Icon(
                            Icons.send,
                            size: 30,
                            color: AppColor.primary,
                          ),
                        ),
                      )
                    ],
                  ).padAll(10),
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            color: AppColor.primary,
            onRefresh: () async {},
            child: SafeArea(
                child: CustomScrollView(
              slivers: [
                const SliverGap(20),
                SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      !state.loading
                          ? Row(
                              children: [
                                InkWell(
                                        onTap: () => context.popRoute(),
                                        child: Assets.svg.backArrowWhite.svg(
                                            color: AppColor.primary,
                                            height: 25,
                                            width: 25))
                                    .padRight(10),
                                CircleAvatar(
                                  backgroundColor: AppColor.white,
                                  radius: 35,
                                  child: (state.data.profileImgUrl.isNotEmpty)
                                      ? CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              state.data.profileImgUrl),
                                        )
                                      : const CircleAvatar(
                                          radius: 30,
                                          backgroundColor: AppColor.primary,
                                          child: Center(
                                            child: Icon(
                                              Icons.person,
                                              size: 30,
                                              color: AppColor.white,
                                            ),
                                          ),
                                        ),
                                ).padRight(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      conatactList
                                          .firstWhere((element) =>
                                              element.id == widget.userId)
                                          .name,
                                      style: AppTextTheme.semiBold16,
                                    ),
                                    Text(
                                      conatactList
                                          .firstWhere((element) =>
                                              element.id == widget.userId)
                                          .email,
                                      style: AppTextTheme.medium14,
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      AppColor.grey.withOpacity(0.4),
                                  radius: 35,
                                ).padRight(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SkeletonWidget(
                                      height: 15,
                                      width: context.widthByPercent(40),
                                    ).pad(bottom: 10),
                                    SkeletonWidget(
                                      height: 15,
                                      width: context.widthByPercent(60),
                                    )
                                  ],
                                )
                              ],
                            ),
                      // const Expanded(child: SizedBox()),
                      // InkWell(
                      //   onTap: () => context.pushRoute(const NotificationRoute()),
                      //   child: const Icon(
                      //     Icons.notifications,
                      //     color: AppColor.grey,
                      //     size: 30,
                      //   ),
                      // ),
                    ],
                  ).padHor(),
                ),
                const SliverGap(25),
                SliverToBoxAdapter(
                  child: ListView.builder(
                      itemCount: state.data.userChatList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = state.data.userChatList[index];
                        return Container(
                          width: context.width,
                          alignment: (item.senderId == state.data.id)
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: AppStyle.shadow,
                                color: (item.senderId == state.data.id)
                                    ? AppColor.primary
                                    : AppColor.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.message,
                                  style: AppTextTheme.semiBold25.copyWith(
                                      color: (item.senderId == state.data.id)
                                          ? AppColor.white
                                          : AppColor.black),
                                ).pad(
                                  bottom: 5,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      (item.senderId == state.data.id)
                                          ? 'Sent'
                                          : 'Recieved',
                                      style: AppTextTheme.semiBold18.copyWith(
                                          color:
                                              (item.senderId == state.data.id)
                                                  ? AppColor.white
                                                  : AppColor.black),
                                    ).padRight(),
                                    Text(
                                      changeToHMSFromBackend(item.createdAt),
                                      style: AppTextTheme.semiBold14.copyWith(
                                          color:
                                              (item.senderId == state.data.id)
                                                  ? AppColor.white
                                                  : AppColor.black),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ).pad(bottom: 10),
                        );
                      }),
                ),
                const SliverGap(25),
              ],
            )),
          )),
    );
  }
}
