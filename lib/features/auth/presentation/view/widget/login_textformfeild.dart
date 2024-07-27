import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/utils/helper/widget/custom_textformfeild.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            print(phone.completeNumber);
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
          isObScure: true,
          suffixIconbutton: IconButton(
            icon: const Icon(Icons.remove_red_eye_rounded),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
