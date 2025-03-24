import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/components/app_text_theme.dart';

final timeProvider = StateProvider<int>((ref) {
  return 0;
});

class OtpTimer extends ConsumerStatefulWidget {
  const OtpTimer({super.key});

  @override
  ConsumerState<OtpTimer> createState() => OtpTimerState();
}

class OtpTimerState extends ConsumerState<OtpTimer> {
  late Timer _timer;

  int seconds = 30;

  late ProviderSubscription _subscription;
  // late ProviderSubscription _loginSubscription;
  // late ProviderSubscription _profileSubscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
      // _subscription = ref.listenManual<bool>(
      //   registerNotifierProvider.select((value) => value.resendOtp),
      //   (prev, next) {
      //     if (prev == true && next == false) {
      //       startTimer();
      //     }
      //   },
      // );

      // ref.read(registerNotifierProvider.notifier).toggleResendOtp(false);
    });
  }

  void startTimer() {
    seconds = 30;
    setState(() {});
    _timer = Timer.periodic(const Duration(seconds: 1), (elapsed) {
      if (seconds == 0) {
        _timer.cancel();
        return;
      }
      seconds = seconds - 1;
      setState(() {});
      ref.read(timeProvider.notifier).update((state) => seconds);
    });
  }

  @override
  void dispose() {
    _subscription.close();

    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '00:${seconds.toString().padLeft(2, '0')} secs',
      style: AppTextTheme.label14,
    );
  }
}
