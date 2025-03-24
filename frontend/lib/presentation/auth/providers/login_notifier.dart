import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/core/extension/future.dart';
import 'package:flutter_master/core/providers/token_provider.dart';
import 'package:flutter_master/data/helper/api_client.dart';
import 'package:flutter_master/domain/model/token.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/model/user_state.dart';
import 'package:flutter_master/presentation/shared/providers/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extension/debug.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, UserState<bool>>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<UserState<bool>> {
// ignore: avoid_public_notifier_properties
  LoginNotifier(this.ref) : super(UserState(data: false)) {
    init();
  }
  final Ref ref;
  late AuthApi _repo;
  @override
  UserState<bool> build() {
    _repo = ref.read(apiProvider).getAuthApi();
    return UserState(data: false);
  }

  void init() {
    _repo = ref.read(apiProvider).getAuthApi();
  }

// ignore: avoid_public_notifier_properties
  final TextEditingController usernameCtrl =
      TextEditingController(text: 'johndoe@yopmail.com'.ifDebug);
// ignore: avoid_public_notifier_properties
  final TextEditingController passwordCtrl =
      TextEditingController(text: '12345678'.ifDebug);
// ignore: avoid_public_notifier_properties

  final loginFormKey = GlobalKey<FormState>();
  final loginOtpBox = List.generate(
    6,
    (index) {
      return TextEditingController();
    },
  );

  @override
  void dispose() {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

//   Future<String?> verifyOtp() async {
//     String? res;
//     _repo = ref.read(authRepoProvider);
//     final result = await _repo.verifyOtp(
//       usernameCtrl.text,
//       state.otpMap.values.join(),
//     );
//     result.fold(
//       (err) {
//         res = err.message;
//         state = state.copyWith(error: err.message);
//       },
//       (r) async {
// // ignore: avoid_manual_providers_as_generated_provider_dependency
//         ref.read(routerProvider).push(const HomeRoute());
//       },
//     );
//     return res;
//   }

//   Future<void> resendOtp() async {
//     for (var element in loginOtpBox) {
//       element.clear();
//     }
//     final result = await _repo.sendOtp(OtpReq(username: usernameCtrl.text));
//     result.fold(
//       (l) => state = state.copyWith(
//         loading: false,
//         error: l.message,
//       ),
//       (r) => state = state.copyWith(
//         loading: false,
//         resendOtp: true,
//         otp: r,
//       ),
//     );
//     toggleResendOtp(false);
//   }

  // Future<String?> login() async {
  //   String? response;
  //   _repo = ref.read(authRepoProvider);
  //   final result =
  //       await _repo.login(usernameCtrl.text.trim(), passwordCtrl.text.trim());
  //   await result.fold((error) {
  //     response = error.message;
  //     state = state.copyWith(error: error.message, loading: false);
  //   }, (result) async {
  //     await ref.refresh(tokenNotifierProvider.notifier).updateToken(result);
  //     state = state.copyWith(data: true, loading: false);
  //   });
  //   return response;
  // }

  Future<String?> login() async {
    String? res;
    final result = await _repo
        .loginUser(
            loginRequest: LoginRequest(
          email: usernameCtrl.text.trim(),
          password: passwordCtrl.text.trim(),
        ))
        .guard<LoginResponse>();
    // result.logWarning();
    // result.fold((l) {
    //   state = state.copyWith(error: l.message, loading: false);
    //   res = l.message;
    // }, (r) async {
    await ref
        .refresh(tokenNotifierProvider.notifier)
        .updateToken(Token(accessToken: result.data?.accessToken ?? ''));
    await Future.delayed(const Duration(milliseconds: 200));
    await ref.read(routerProvider).replaceAll([const MainRoute()]);
    state = state.copyWith(error: '', loading: false);
    // });
    return res;
  }

  //  Future<String?> login() async {
  //   String? response;
  //   _repo = ref.read(authRepoProvider);
  //   final result = await _repo.generateToken(
  //       usernameCtrl.text.trim(), passwordCtrl.text.trim());
  //   await result.fold((error) {
  //     response = error.message;
  //     state = state.copyWith(error: error.message, loading: false);
  //   }, (result) async {
  //     await ref.refresh(tokenNotifierProvider.notifier).updateToken(result);
  //     state = state.copyWith(data: true, loading: false);
  //   });
  //   return response;
  // }

  // void setOtpState(int index, String value) {
  //   final otpMap = {...state.otpMap, index: value};
  //   state = state.copyWith(
  //     otpMap: otpMap,
  //     error: '',
  //   );
  // }

  // void toggleResendOtp(bool enabled) {
  //   state = state.copyWith(
  //     resendOtp: enabled,
  //     otpError: '',
  //   );
  // }
}
