import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/presentation/theme/config/app_color.dart';

import '../../../core/extension/context.dart';
import '../../shared/components/app_text_theme.dart';
import '../../theme/config/app_style.dart';

// ignore: must_be_immutable
class OtpBox extends StatefulWidget {
  OtpBox({
    super.key,
    required this.controller,
    required this.error,
    this.onChanged,
  });

  final TextEditingController controller;
  bool error;
  final Function(String)? onChanged;

  @override
  State<OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<OtpBox> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    return RawKeyboardListener(
      focusNode: FocusNode(canRequestFocus: false),
      onKey: (value) {
        const backspace = LogicalKeyboardKey.backspace;
        if (value.isKeyPressed(backspace)) {
          if (count > 0) {
            FocusScope.of(context).previousFocus();
            count = 0;
            return;
          }
          count++;
        }
      },
      child: Container(
        width: 60,
        height: context.heightByPercent(8),
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: AppStyle.shadow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextField(
            cursorColor: AppColor.black,
            style: AppTextTheme.semiBold30
                .copyWith(color: widget.error ? AppColor.red : null),
            maxLength: 1,
            controller: widget.controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.white),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.white),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.red),
              ),
              errorStyle: const TextStyle(height: 0),
              counterText: '',
              errorText: widget.error ? '' : null,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // onChanged: (value) {
            //   if (value.isNotEmpty) {
            //     FocusScope.of(context).nextFocus();
            //   }
            // },
            onChanged: (value) {
              setState(() {
                widget.error = false;
              });
              if (value.isNotEmpty) {
                FocusScope.of(context).nextFocus();
              }
              widget.onChanged?.call(value);
            },
          ),
        ),
      ),
    );
  }
}
