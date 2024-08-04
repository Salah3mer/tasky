import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_colors.dart';

enum ColorName {
  high,
  medium,
  low,
}

class ColorHelper {
  static Map<ColorName, Color> colors = {
    ColorName.high: const Color(0xffFF7D53),
    ColorName.medium: AppColor.primaryColor,
    ColorName.low: const Color(0xff0087FF)
  };

  static Color getColor(ColorName colorName) {
    return colors[colorName] ?? Colors.black;
  }

  static ColorName stringToColorName(String name) {
    switch (name) {
      case 'high':
        return ColorName.high;
      case 'medium':
        return ColorName.medium;
      case 'low':
        return ColorName.low;
      default:
        return ColorName.low; // Default value
    }
  }
}

enum StatusColorName {
  waiting,
  inprogress,
  finished,
}

class StatusColorHelper {
  static Map<StatusColorName, Color> colors = {
    StatusColorName.waiting: const Color(0xffFF7D53),
    StatusColorName.inprogress: AppColor.primaryColor,
    StatusColorName.finished: const Color(0xff0087FF)
  };

  static Color getColor(StatusColorName colorName) {
    return colors[colorName] ?? Colors.black;
  }

  static StatusColorName stringToColorName(String name) {
    switch (name) {
      case 'inprogress':
        return StatusColorName.inprogress;
      case 'waiting':
        return StatusColorName.waiting;
      case 'finished':
        return StatusColorName.finished;
      default:
        return StatusColorName.waiting;
    }
  }
}
