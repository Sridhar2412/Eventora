import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/custom_filled_button.dart';
import 'package:flutter_master/presentation/shared/components/input_field_card.dart';
import 'package:flutter_master/presentation/shared/providers/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/extension/context.dart';
import '../../core/extension/widget.dart';
import '../shared/components/app_text_theme.dart';
import '../shared/components/custom_dialog.dart';
import '../shared/components/custom_form_field.dart';
import '../theme/config/app_color.dart';
import 'providers/login_notifier.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

final isPasswordVisibleProvider = StateProvider<bool>((ref) {
  return true;
});

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: 'Are you sure?',
            description: 'Do you want to exit the App',
            onPositive: () => Navigator.of(context).pop(true),
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    final visible = ref.watch(isPasswordVisibleProvider);
    final error =
        ref.watch(loginNotifierProvider.select((value) => value.error));
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(context.heightByPercent(16.4)),
              Form(
                key: notifier.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: AppTextTheme.semiBold18,
                    ),
                    const Gap(40),
                    InputFieldCard(
                      child: CustomFormField(
                        controller: notifier.usernameCtrl,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email*',
                        validator: (String? email) {
                          if (email == null || email.isEmpty) {
                            return 'Please enter your email';
                          }
                          final regex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!regex.hasMatch(email)) {
                            return 'Enter valid E-Mail';
                          }

                          return null;
                        },
                      ).pad(top: 10, left: 20, right: 20, bottom: 10),
                    ),
                    const Gap(15),
                    InputFieldCard(
                      child: CustomFormField.password(
                        controller: notifier.passwordCtrl,
                        hintText: 'Password*',
                        passwordVisible: visible,
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password should atleast have 8 characters';
                          }

                          return null;
                        },
                      ).pad(top: 10, left: 20, bottom: 10),
                    ),
                    const Gap(25),
                    CustomFilledButton(
                        color: AppColor.primary,
                        title: 'Proceed',
                        onTap: () async {
                          if (notifier.loginFormKey.currentState?.validate() ==
                              true) {
                            final data = await notifier.login();
                            if (data == null) {
                              ref
                                  .read(routerProvider)
                                  .replaceAll([const MainRoute()]);
                            } else {
                              SnackBar(
                                content: Text(
                                  data,
                                  style: AppTextTheme.label14
                                      .copyWith(color: AppColor.white),
                                ),
                                backgroundColor: AppColor.red,
                              );
                            }
                          }
                        }),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Gap(25),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppTextTheme.label14.copyWith(
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).padHor(),
              ),
              const Gap(70),
              Divider(
                thickness: 1,
                height: 1,
                color: AppColor.black.withOpacity(0.2),
              ),
              const Gap(20),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextTheme.label14,
                    text: 'Not a member yet? ',
                    children: [
                      TextSpan(
                        text: 'Click here',
                        style: AppTextTheme.medium14
                            .copyWith(color: AppColor.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.replaceRoute(const RegisterRoute());
                          },
                      ),
                      const TextSpan(
                        text: ' to sign up',
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
