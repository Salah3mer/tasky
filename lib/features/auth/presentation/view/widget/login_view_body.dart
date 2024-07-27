import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/core/utils/helper/widget/costum_button.dart';
import 'package:tasky/features/auth/presentation/view/widget/dont_have_account_text.dart';
import 'package:tasky/features/auth/presentation/view/widget/login_textformfeild.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AppImages.onBoardingImage2,
          height: MediaQuery.sizeOf(context).height * .58,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: AppFonts.font24BoldColorDark(context),
              ),
              const SizedBox(
                height: 24,
              ),
              const LoginTextFormField(),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Sign In',
                onTap: () {},
                widthPadding: 0,
              ),
              const SizedBox(
                height: 24,
              ),
              const DontHaveAccountText(),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
