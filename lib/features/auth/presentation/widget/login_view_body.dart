import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/helper/widget/custom_button.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';
import 'package:tasky/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:tasky/features/auth/presentation/widget/dont_have_account_text.dart';
import 'package:tasky/features/auth/presentation/widget/login_textformfeild.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CashHelper.setString(
              key: AppConstans.tokenKey, value: state.userModel.accessToken!);
          AppConstans.token = state.userModel.accessToken;
          AppConstans.reFreshtoken = state.userModel.refreshToken;
          CashHelper.setString(
              key: AppConstans.reFreshtokenKey,
              value: state.userModel.refreshToken!);

          showTopSnackBar(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              Overlay.of(context),
              const CustomSnackBar.success(
                message: "Good job, your Login is successful. Have a nice day",
              ));
          context.pushReplacementNamed(Routes.homeView);
        } else if (state is LoginErrorState) {
          showTopSnackBar(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              Overlay.of(context),
              CustomSnackBar.error(
                  maxLines: 5,
                  message:
                      'There is some information. You need to do something with that${state.error.toString()}'));
        }
      },
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).formKey,
          child: Column(
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
                      onTap: () {
                        if (LoginCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          LoginCubit.get(context).login();
                        }
                      },
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
          ),
        );
      },
    );
  }
}
