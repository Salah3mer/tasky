import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/font_weight_helper.dart';

class AppFonts {
  static TextStyle font24BoldColorDark(context) => GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        color: Colors.black,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle font16BoldColorDark(context) => GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        color: Color(0xff24252C),
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle font12MediumColorOrange(context) => GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        color: Color(0xffFF7D53),
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle font13RegularColorGray(context) => GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        color: Color(0xff6E6A7C),
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle font19MediumColorprimary(context) => GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, fontSize: 19),
        color: AppColor.primaryColor,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle font14RegularColorGray(context) => GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        color: const Color(0xff6E6A7C),
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle font18BoldColorWhite(context) => GoogleFonts.dmSans(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: Colors.white,
        fontWeight: FontWeightHelper.bold,
      );
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 550;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
