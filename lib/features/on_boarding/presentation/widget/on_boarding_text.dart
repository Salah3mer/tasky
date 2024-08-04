import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_fonts.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Task Management &\nTo-Do List',
          style: AppFonts.font24BoldColorDark(context).copyWith(height: 1.3),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'This productive tool is designed to help\nyou better manage your task \nproject-wise conveniently!',
          style: AppFonts.font14RegularColorGray(context),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
