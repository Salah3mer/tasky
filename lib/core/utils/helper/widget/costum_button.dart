import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_colors.dart';

import 'package:tasky/config/styles/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final double? widthPadding;
  final Function()? onTap;
  final Widget? widget;
  const CustomButton(
      {super.key,
      this.text,
      required this.onTap,
      this.widget,
      this.widthPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widthPadding ?? 30),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: onTap,
          child: text != null
              ? Text(text!, style: AppFonts.font18BoldColorWhite(context))
              : widget),
    );
  }
}
