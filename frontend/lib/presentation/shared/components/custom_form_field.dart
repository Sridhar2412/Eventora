import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/presentation/shared/components/change_date_time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/extension/context.dart';
import '../../../core/extension/datetime.dart';
import '../../../core/extension/widget.dart';
import '../../theme/config/app_color.dart';
import 'app_text_theme.dart';
import 'validation.dart';

class CustomFormField extends ConsumerStatefulWidget with FormValidationMixin {
  const CustomFormField({
    super.key,
    this.inputFormatters,
    this.validator,
    this.hintStyle,
    this.controller,
    this.keyboardType,
    this.prefixText,
    this.decoration,
    this.prefixIcon,
    this.hintText,
    this.onChanged,
    this.labelText,
    this.enabled = true,
    this.readOnly,
    this.suffixIcon,
    this.onTap,
    this.obscureText,
    this.focusColor,
    this.enabledColor,
    this.maxLines,
    this.onCompleted,
    this.startDateFilter,
    this.endDateFilter,
    this.maxLength,
    this.passwordVisible,
    this.onPressed,
    this.textCapitalization,
    this.label,
    this.noBorder,
    this.suffixText,
    this.contentPadding,
  });

  factory CustomFormField.date({
    required BuildContext context,
    TextEditingController? controller,
    TextEditingController? startDateFilter,
    TextEditingController? endDateFilter,
    String? hintText,
    TextStyle? hintStyle,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    Widget? suffixIcon,
    Widget? prefixIcon,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    return CustomFormField(
      validator: validator,
      controller: controller,
      hintText: hintText,
      suffixIcon: suffixIcon,
      hintStyle: hintStyle,
      readOnly: true,
      prefixIcon: prefixIcon,
      onChanged: onChanged,
      noBorder: true,
      onTap: () async {
        final now = DateTime.now();
        final result = await showDatePicker(
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: AppTextTheme.base, // Input label
                ),
                textTheme: TextTheme(
                  bodySmall: GoogleFonts.openSans(),
                ),
                colorScheme: const ColorScheme.light(
                  primary: AppColor.white, // header background color
                  surface: AppColor.primary, // header background color
                  onPrimary: AppColor.primary, // header text color
                  onSurface: AppColor.white,

                  // body text color
                ),
                dialogBackgroundColor: AppColor.primary,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          context: context,
          initialDate: now,
          firstDate: firstDate ?? now,
          lastDate: lastDate ?? DateTime(now.year + 5),
        );
        if (result != null) {
          controller?.text = changeToSimpleDMY(result.toString());
          startDateFilter?.text = DateFormat('dd/MM/yyyy')
              .parse(changeToSimpleDMY(result.toString()))
              .toBackendDateFormat();
          endDateFilter?.text = DateFormat('dd/MM/yyyy')
              .parse(
                changeToSimpleDMY(
                  result.add(const Duration(days: 1)).toString(),
                ),
              )
              .toBackendDateFormat();
        }
      },
    );
  }
  factory CustomFormField.dateFilter({
    required BuildContext context,
    TextEditingController? controller,
    TextEditingController? startDateFilter,
    TextEditingController? endDateFilter,
    String? hintText,
    TextStyle? hintStyle,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    Widget? suffixIcon,
    DateTime? firstDate,
  }) {
    return CustomFormField(
      validator: validator,
      controller: controller,
      hintText: hintText,
      suffixIcon: suffixIcon,
      hintStyle: hintStyle,
      readOnly: true,
      onChanged: onChanged,
      keyboardType: TextInputType.none,
      onTap: () async {
        final now = DateTime.now();
        final result = await showDateRangePicker(
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: AppTextTheme.base, // Input label
                ),
                textTheme: TextTheme(
                  bodySmall: GoogleFonts.openSans(),
                ),
                colorScheme: const ColorScheme.light(
                  primary: AppColor.grey, // header background color
                  surface: AppColor.primary, // header background color
                  onPrimary: Colors.green, // header text color
                  onSurface: AppColor.white,

                  // body text color
                ),
                dialogBackgroundColor: AppColor.primary,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                    // button text color
                  ),
                ),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: context.heightByPercent(72),
                    child: child,
                  ),
                ),
              ).padHor(),
            );
          },
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          context: context,
          firstDate: firstDate ?? now,
          currentDate: now,
          lastDate: DateTime(now.year + 5),
          keyboardType: TextInputType.none,
        );

        if (result != null) {
          controller?.text = changeToSimpleDMY(result.start.toString());
          startDateFilter?.text = changeToSimpleDMY(result.start.toString());
          endDateFilter?.text = changeToSimpleDMY(result.end.toString());
        }
      },
    );
  }

  factory CustomFormField.name({
    TextEditingController? controller,
    Widget? prefixIcon,
    String? hintText,
    bool? noBorder,
  }) =>
      CustomFormField(
        noBorder: noBorder,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp("^[A-Za-z][A-Za-z,.' -]{0,}"),
          ),
        ],
        validator: (value) {
          if (value?.trim().isEmpty == true) {
            return 'Name is required';
          }
          return null;
        },
        hintText: hintText ?? 'Enter full name',
        controller: controller,
        keyboardType: TextInputType.name,
        prefixIcon: prefixIcon,
      );

  factory CustomFormField.webLink({
    TextEditingController? controller,
    Widget? prefixIcon,
    String? hintText,
  }) =>
      CustomFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null;
          }
          if (!value.contains('.')) {
            return 'Invalid url';
          }
          return null;
        },
        hintText: hintText ?? 'Enter full name',
        controller: controller,
        keyboardType: TextInputType.name,
        prefixIcon: prefixIcon,
      );

  factory CustomFormField.password({
    TextEditingController? controller,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    String? hintText,
    Function()? onPressed,
    bool? passwordVisible,
    bool? noBorder,
  }) =>
      CustomFormField(
        obscureText: passwordVisible,
        hintText: hintText,
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.deny(
            RegExp('^[ ]'),
          ),
        ],
        keyboardType: TextInputType.name,
        prefixIcon: prefixIcon,
        onChanged: onChanged,
        contentPadding: const EdgeInsets.all(5),
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
        ),
        suffixIcon: IconButton(
          icon: passwordVisible ?? false
              ? const Icon(
                  size: 25,
                  Icons.visibility_off_outlined,
                  color: AppColor.grey,
                )
              : const Icon(
                  size: 25,
                  Icons.visibility_outlined,
                  color: AppColor.grey,
                ),
          onPressed: onPressed,
        ),
        noBorder: noBorder,
      );

  factory CustomFormField.address({
    TextEditingController? controller,
    Widget? prefixIcon,
  }) =>
      CustomFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('^[A-Za-z0-9,.][A-Za-z0-9,. ]{0,}'),
          ),
        ],
        validator: (value) {
          if (value?.trim().isEmpty == true) {
            return 'Address is required';
          }
          return null;
        },
        hintText: 'Enter Address',
        controller: controller,
        keyboardType: TextInputType.text,
        prefixIcon: prefixIcon,
      );

  factory CustomFormField.age({TextEditingController? controller}) =>
      CustomFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          if (value?.trim().isEmpty == true || value == null) {
            return 'Age is required';
          }
          if (!(int.parse(value) >= 1 && int.parse(value) <= 120)) {
            return 'Invalid Age';
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.number,
      );

  factory CustomFormField.phone({
    TextEditingController? controller,
    Widget? prefixIcon,
    Function(String)? onChanged,
    final String? Function(String?)? validator,
    String? hintText,
    bool? isCompulsory,
    bool? isError,
    TextStyle? style,
  }) =>
      CustomFormField(
        onChanged: onChanged,
        controller: controller,
        prefixIcon: prefixIcon,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        label: hintText ?? 'Enter mobile number',
        maxLength: 10,
        validator: validator ??
            (String? phone) {
              if (phone == null || phone.isEmpty == true) {
                if (isCompulsory != null && isCompulsory != true) {
                  isError = false;

                  return null;
                }
                isError = true;
                return 'Please enter your mobile number';
              }

              if (phone.length != 10) {
                isError = true;

                return 'Please enter correct mobile number';
              }
              if (phone.startsWith('000')) {
                isError = true;
                return 'Invalid mobile number';
              }
              isError = false;

              return null;
            },
      );

  factory CustomFormField.number({
    TextEditingController? controller,
    String? label,
    bool? noBorder,
    final String? Function(String?)? validator,
  }) =>
      CustomFormField(
        noBorder: noBorder,
        controller: controller,
        hintText: '$label',
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: validator,
      );

  factory CustomFormField.other({
    TextEditingController? controller,
    String? label,
  }) =>
      CustomFormField(
        controller: controller,
        hintText: 'Enter $label',
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9., ]')),
        ],
        validator: (String? data) {
          if (data == null || data.trim().isEmpty == true) {
            return '$label is required';
          }

          return null;
        },
      );

  factory CustomFormField.countryCode({
    TextEditingController? controller,
    String? prefixText,
  }) =>
      CustomFormField(
        decoration: InputDecoration(
          prefixText: prefixText,
        ),
        controller: controller,
        keyboardType: TextInputType.text,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[+][0-9]{0,}')),
        ],
        validator: (String? data) {
          if (data == null || data.isEmpty == true) {
            return 'Please enter country code';
          }

          if (data.length != 2) {
            return 'Country Code be should be of 2 digits';
          }

          return null;
        },
      );

  factory CustomFormField.email({
    TextEditingController? controller,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? readOnly,
    bool? noBorder,
  }) =>
      CustomFormField(
        noBorder: noBorder,
        controller: controller,
        prefixIcon: prefixIcon,
        readOnly: readOnly,
        suffixIcon: suffixIcon,
        keyboardType: TextInputType.emailAddress,
        inputFormatters: const [],
        hintText: 'Enter your email',
        contentPadding: const EdgeInsets.all(5),

        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.black.withOpacity(0.2)),
          ),
        ),
        // hintText: 'EMAIL*',
        validator: (String? email) {
          if (email == null || email.isEmpty) {
            return 'Please enter the email address';
          }
          final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          if (!regex.hasMatch(email)) {
            return 'Enter valid E-Mail';
          }

          return null;
        },
      );

  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String? prefixText;
  final Widget? prefixIcon;
  final String? hintText;
  final String? label;
  final String? suffixText;
  final String? startDateFilter;
  final String? endDateFilter;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;
  final String? labelText;
  final bool enabled;
  final bool? readOnly;
  final bool? obscureText;
  final bool? passwordVisible;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Color? focusColor;
  final Color? enabledColor;
  final int? maxLines;
  final VoidCallback? onCompleted;
  final int? maxLength;
  final Function()? onPressed;
  final TextCapitalization? textCapitalization;
  final bool? noBorder;
  final EdgeInsetsGeometry? contentPadding;

  @override
  ConsumerState<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends ConsumerState<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      cursorColor: AppColor.primary,
      obscuringCharacter: '*',
      onTap: widget.onTap,
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      onEditingComplete: widget.onCompleted,
      readOnly: widget.readOnly ?? false,
      style: widget.hintStyle ?? const TextStyle(fontFamily: 'Open Sans'),
      decoration: InputDecoration(
        focusedBorder: widget.noBorder ?? false
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.enabledColor ?? AppColor.black),
              ),
        enabledBorder: widget.noBorder ?? false
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.focusColor ?? AppColor.black),
              ),
        errorBorder: widget.noBorder ?? false
            ? InputBorder.none
            : const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.red),
              ),
        focusedErrorBorder: widget.noBorder ?? false
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.focusColor ?? AppColor.black),
              ),
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorStyle: AppTextTheme.label12.copyWith(color: AppColor.red),
        labelStyle: widget.hintStyle ??
            AppTextTheme.label14.copyWith(
              color: AppColor.black,
            ),
        hintStyle: widget.hintStyle ??
            AppTextTheme.label14.copyWith(
              color: AppColor.black,
            ),
        enabled: widget.enabled,
        // suffixIconConstraints: const BoxConstraints(
        //   maxHeight: 30,
        // ),
        suffixIcon: widget.suffixIcon,
        suffixText: widget.suffixText,
        suffixStyle: AppTextTheme.medium14,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(maxWidth: 60),
        counterText: '',
      ),
    );
  }
}
