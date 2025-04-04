import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../data/model/otp_req.dart';
import '../../../data/repository/auth_repo_impl.dart';
import '../../../domain/repository/auth_repo.dart';
import 'register_state.dart';

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier(ref);
});

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier(this.ref) : super(const RegisterState());

  final Ref ref;
  late final AuthRepository _auth = ref.read(authRepoProvider);

  final registerForm = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController(text: '');
  final mobileCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final roleCtrl = TextEditingController();
  final organizationCtrl = TextEditingController();

  final registerOtpBox = List.generate(
    6,
    (index) {
      return TextEditingController();
    },
  );

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    mobileCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    pageCtrl.dispose();
    dobCtrl.dispose();
    roleCtrl.dispose();
    organizationCtrl.dispose();
    super.dispose();
  }

  void clear() {
    nameCtrl.clear();
    emailCtrl.clear();
    mobileCtrl.clear();
    passwordCtrl.clear();
    confirmPasswordCtrl.clear();
    roleCtrl.clear();
    organizationCtrl.clear();
    dobCtrl.clear();
  }

  PageController pageCtrl = PageController();

  void setPage(int pageNumber) {
    pageCtrl.jumpToPage(pageNumber);
  }

  Future<bool> registerUser() async {
    bool response = false;
    state = state.copyWith(loading: true, error: '');
    final result = await _auth.saveUser(
        nameCtrl.text.trim(),
        emailCtrl.text.trim(),
        mobileCtrl.text.trim(),
        confirmPasswordCtrl.text.trim());

    result.fold(
      (err) {
        response = false;
        state = state.copyWith(
          error: err.message,
          loading: false,
        );
      },
      (result) {
        response = true;
        state = state.copyWith(loading: false, error: '');
      },
    );
    return response;
  }

  // Future<bool> sendOtp() async {
  //   bool response = false;
  //   state = state.copyWith(loading: true, error: '');
  //   final result = await _auth.sendOtp(
  //     OtpReq(
  //       username: emailCtrl.text,
  //     ),
  //   );

  //   result.fold(
  //     (err) {
  //       response = false;
  //       state = state.copyWith(
  //         error: err.message,
  //         loading: false,
  //         resendOtp: false,
  //       );
  //     },
  //     (otp) {
  //       response = true;
  //       state = state.copyWith(otp: otp, loading: false, resendOtp: false);
  //     },
  //   );
  //   return response;
  // }

  // Future<bool> verifyOtp() async {
  //   bool response = false;
  //   final result = await _auth.verifyOtp(
  //     emailCtrl.text,
  //     state.otpMap.values.join(),
  //   );
  //   await result.fold(
  //     (err) {
  //       response = false;
  //       state = state.copyWith(error: err.message);
  //     },
  //     (r) async {
  //       response = true;
  //       // final data = await register();
  //       // if (data != null) {
  //       state = state.copyWith(error: '');
  //       response = false;
  //       // }
  //     },
  //   );
  //   return response;
  // }

  // Future<void> resendOtp() async {
  //   for (final element in registerOtpBox) {
  //     element.clear();
  //   }
  //   final result = await _auth.sendOtp(OtpReq(username: emailCtrl.text));
  //   result.fold(
  //     (l) => state = state.copyWith(
  //       loading: false,
  //       error: l.message,
  //     ),
  //     (r) => state = state.copyWith(
  //       loading: false,
  //       resendOtp: true,
  //       otp: r,
  //     ),
  //   );
  //   toggleResendOtp(false);
  // }

  void setOtpState(int index, String value) {
    final otpMap = {...state.otpMap, index: value};
    state = state.copyWith(
      otpMap: otpMap,
      error: '',
    );
  }

  void toggleResendOtp(bool enabled) {
    state = state.copyWith(
      resendOtp: enabled,
      otpError: '',
    );
  }

  void nextPage() {
    pageCtrl.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    pageCtrl.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
