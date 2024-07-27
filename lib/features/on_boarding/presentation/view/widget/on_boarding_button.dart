import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/helper/widget/costum_button.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get Started',
              style: AppFonts.font18BoldColorWhite(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              AppImages.arrowIcon,
            )
          ],
        ),
        onTap: () {
          context.pushReplacementNamed(Routes.loginView);
          CashHelper.setBoolean(key: AppConstans.onBoardingKey, value: true);
        });
  }
}
