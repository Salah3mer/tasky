import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/core/utils/helper/widget/custom_button.dart';
import 'package:tasky/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:tasky/features/auth/presentation/widget/already_have_account.dart';
import 'package:tasky/features/auth/presentation/widget/register_textformfield.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (BuildContext context, RegisterState state) {
        if (state is RegisterSuccessState) {
          print(state.userModel.displayName);
        }
        if (state is RegisterErrorState) {
          print(state.error);
        }
      },
      builder: (BuildContext context, RegisterState state) => SafeArea(
        child: Form(
          key: RegisterCubit.get(context).formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .24,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.onBoardingImage2,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Register',
                  style: AppFonts.font24BoldColorDark(context),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const RegisterTextformfield(),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                  text: 'Sign Up',
                  onTap: () {
                    if (RegisterCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      RegisterCubit.get(context).register();
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              const AlreadyHaveAccountText(),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
