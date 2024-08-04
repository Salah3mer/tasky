import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/features/on_boarding/presentation/widget/on_boarding_button.dart';
import 'package:tasky/features/on_boarding/presentation/widget/on_boarding_text.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Image.asset(
            AppImages.onBoardingImage2,
            fit: BoxFit.fitHeight,
          )),
          const SizedBox(height: 24),
          const OnBoardingText(),
          const SizedBox(height: 24),
          const OnBoardingButton(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
