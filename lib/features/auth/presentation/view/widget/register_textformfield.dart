import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/utils/helper/widget/custom_textformfeild.dart';
import 'package:tasky/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterTextformfield extends StatelessWidget {
  const RegisterTextformfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          CustomTextFormFeild(
            label: 'Name',
            textInputType: TextInputType.name,
            controller: RegisterCubit.get(context).nameController,
            validator: (value) {
              if (value!.isNotEmpty) {
                return null;
              }
              return 'Please enter your Name';
            },
          ),
          const SizedBox(
            height: 15,
          ),
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
              RegisterCubit.get(context).phoneController.text =
                  phone.completeNumber;
            },
            onCountryChanged: (country) {
              print('Country changed to: ${country.name}');
            },
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormFeild(
            label: 'Years of experience...',
            textInputType: TextInputType.number,
            controller: RegisterCubit.get(context).experinceController,
            validator: (value) {
              if (value!.isNotEmpty) {
                return null;
              }
              return 'Please enter your Name';
            },
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownMenu(
            width: MediaQuery.sizeOf(context).width * .88,
            inputDecorationTheme: InputDecorationTheme(
                fillColor: const Color(0xffFFFFFF),
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: AppColor.primaryColor)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffBABABA)))),
            label: const Text('Choose experience Level'),
            initialSelection: 1,
            controller: RegisterCubit.get(context).experincelevelController,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 1, label: 'fresh'),
              DropdownMenuEntry(value: 2, label: 'junior'),
              DropdownMenuEntry(value: 3, label: 'midLevel'),
              DropdownMenuEntry(value: 4, label: 'senior'),
            ],
            hintText: 'Choose experience Level',
            onSelected: (vlue) {
              print(RegisterCubit.get(context).experincelevelController.text);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormFeild(
            label: 'Address',
            textInputType: TextInputType.streetAddress,
            controller: RegisterCubit.get(context).addressController,
            validator: (value) {
              if (value!.isNotEmpty) {
                return null;
              }
              return 'Please enter your Address';
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormFeild(
            label: 'password',
            controller: RegisterCubit.get(context).passwordController,
            validator: (value) {
              if (value!.isNotEmpty && value.length >= 6) {
                return null;
              }
              return 'Please enter your password';
            },
            isObScure: RegisterCubit.get(context).isObScure,
            suffixIconbutton: IconButton(
              icon: RegisterCubit.get(context).isObScure
                  ? const Icon(FontAwesomeIcons.eye)
                  : const Icon(FontAwesomeIcons.eyeSlash),
              onPressed: () {
                RegisterCubit.get(context).changeEyeState();
              },
            ),
          ),
        ],
      ),
    );
  }
}
