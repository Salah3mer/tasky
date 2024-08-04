import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/utils/helper/widget/custom_textformfeild.dart';
import 'package:tasky/features/auth/presentation/cubits/login/login_cubit.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            IntlPhoneField(
              flagsButtonPadding: const EdgeInsets.only(left: 15),
              initialCountryCode: 'EG',
              flagsButtonMargin: const EdgeInsets.all(8),
              dropdownIconPosition: IconPosition.trailing,
              focusNode: FocusNode(),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Phone Number',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: AppColor.primaryColor)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xffBABABA)))),
              languageCode: "en",
              onChanged: (phone) {
                LoginCubit.get(context).phoneController.text =
                    phone.completeNumber;
              },
              onCountryChanged: (country) {
                print('Country changed to: ${country.name}');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormFeild(
              label: 'password',
              controller: LoginCubit.get(context).passwordController,
              validator: (value) {
                if (value!.isNotEmpty && value.length >= 6) {
                  return null;
                }
                return 'Please enter your password';
              },
              isObScure: LoginCubit.get(context).isObScure,
              suffixIconbutton: IconButton(
                icon: LoginCubit.get(context).isObScure
                    ? const Icon(FontAwesomeIcons.eye)
                    : Icon(FontAwesomeIcons.eyeSlash),
                onPressed: () {
                  LoginCubit.get(context).changeEyeState();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
