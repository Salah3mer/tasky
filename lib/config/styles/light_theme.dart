import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_colors.dart';

lightTheme() => ThemeData(
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColor.secFloatingActionButton,
      ),
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.white),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
