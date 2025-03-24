// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/presentation/auth/providers/register_notifier.dart';
import 'package:flutter_master/presentation/routes/app_router.dart';
import 'package:flutter_master/presentation/shared/components/app_text_theme.dart';
import 'package:flutter_master/presentation/shared/components/custom_filled_button.dart';
import 'package:flutter_master/presentation/shared/components/custom_form_field.dart';
import 'package:flutter_master/presentation/shared/components/input_field_card.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../core/extension/context.dart';
import '../../../core/extension/widget.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _HomePageState();
}

final isPasswordVisibleProvider = StateProvider<bool>((ref) {
  return true;
});
final isConfirmPasswordVisibleProvider = StateProvider<bool>((ref) {
  return true;
});

class _HomePageState extends ConsumerState<RegisterPage> {
  @override
  void initState() {
    ref.read(isPasswordVisibleProvider.select((value) => true));
    ref.read(isConfirmPasswordVisibleProvider.select((value) => true));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? password;
  String? confirmPassword;
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(registerNotifierProvider.notifier);
    final visible = ref.watch(isPasswordVisibleProvider);
    final confirm = ref.watch(isConfirmPasswordVisibleProvider);

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(context.heightByPercent(10.5)),
            Form(
              key: notifier.registerForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Registration',
                    style: AppTextTheme.semiBold18,
                  ),
                  const Gap(40),
                  InputFieldCard(
                    child: CustomFormField(
                      controller: notifier.nameCtrl,
                      labelText: 'Your name*',
                      maxLength: 30,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[A-Za-z. ]'),
                        ),
                      ],
                      validator: (String? data) {
                        if (data == null || data.trim().isEmpty == true) {
                          return 'Please enter your name';
                        }

                        return null;
                      },
                    ).pad(top: 10, left: 20, right: 20, bottom: 10),
                  ),
                  const Gap(20),
                  InputFieldCard(
                    child: CustomFormField.email(
                      controller: notifier.emailCtrl,
                    ).pad(top: 10, left: 20, right: 20, bottom: 10),
                  ),
                  const Gap(20),
                  InputFieldCard(
                    child: CustomFormField.phone(
                      controller: notifier.mobileCtrl,
                      hintText: 'Enter Phone number',
                    ).pad(top: 10, left: 20, right: 20, bottom: 10),
                  ),
                  const Gap(20),
                  InputFieldCard(
                    child: CustomFormField.password(
                      controller: notifier.passwordCtrl,
                      hintText: 'Password*',
                      passwordVisible: visible,
                      onChanged: (value) {
                        password = value;
                      },
                      onPressed: () {
                        ref.read(isPasswordVisibleProvider.notifier).update(
                              (state) => !state,
                            );
                      },
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
                  const Gap(20),
                  InputFieldCard(
                    child: CustomFormField.password(
                      controller: notifier.confirmPasswordCtrl,
                      hintText: 'Confirm Password*',
                      passwordVisible: confirm,
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return 'Please enter your confirm password';
                        }
                        if (value != notifier.passwordCtrl.text) {
                          return 'Passwords do not match.';
                        }

                        return null;
                      },
                      onPressed: () {
                        ref
                            .read(isConfirmPasswordVisibleProvider.notifier)
                            .update(
                              (state) => !state,
                            );
                      },
                    ).pad(top: 10, left: 20, bottom: 10),
                  ),
                  const Gap(20),
                  Consumer(
                    builder: (context, ref, child) {
                      // final registrationState =
                      //     ref.watch(registerNotifierProvider);
                      // if (registrationState.loading) {
                      //   return const AppLoader();
                      // }
                      return CustomFilledButton(
                        color: AppColor.primary,
                        size: Size(context.width, 50),
                        title: 'Proceed',
                        onTap: () async {
                          if (notifier.registerForm.currentState?.validate() ==
                              true) {
                            final data = await notifier.registerUser();
                            if (data == true) {
                              context.replaceRoute(const LoginRoute());
                            }
                          }
                        },
                      );
                    },
                  ),
                ],
              ).padHor(),
            ),
            const Gap(30),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextTheme.label14,
                  text: 'Already Registered? ',
                  children: [
                    TextSpan(
                      text: 'Click here',
                      style: AppTextTheme.medium14
                          .copyWith(color: AppColor.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.replaceRoute(const LoginRoute());
                        },
                    ),
                    const TextSpan(
                      text: ' to login',
                    ),
                  ],
                ),
              ),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
