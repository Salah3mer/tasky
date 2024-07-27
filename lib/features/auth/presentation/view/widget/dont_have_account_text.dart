import 'package:flutter/material.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/config/styles/font_weight_helper.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.registerView);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an account?',
                style: AppFonts.font14RegularColorGray(context),
              ),
              TextSpan(
                text: ' Sign Up',
                style: AppFonts.font14RegularColorGray(context).copyWith(
                    color: AppColor.primaryColor,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeightHelper.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
