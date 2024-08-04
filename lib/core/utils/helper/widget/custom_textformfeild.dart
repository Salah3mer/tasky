import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';

class CustomTextFormFeild extends StatelessWidget {
  Color? color;
  Function()? onTap;
  Function()? onComplet;
  Function(String val)? onCahange;
  Function(String? val)? onSave;
  Function(String val)? onSubmit;
  String? Function(String? val)? validator;
  TextInputType? textInputType;
  TextEditingController? controller;
  String label;
  bool readOnly;
  bool? isObScure;
  Widget? suffixIconbutton;
  Icon? prefixIcon;
  int? maxLine;
  double? contantPadding;
  CustomTextFormFeild(
      {super.key,
      this.textInputType,
      this.maxLine,
      this.isObScure,
      this.suffixIconbutton,
      this.prefixIcon,
      this.onTap,
      this.onCahange,
      this.onComplet,
      this.controller,
      this.onSave,
      this.onSubmit,
      this.validator,
      this.readOnly = false,
      required this.label,
      this.contantPadding,
      this.color});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: maxLine ?? 1,
        controller: controller,
        onTap: onTap,
        onChanged: onCahange,
        onEditingComplete: onComplet,
        onFieldSubmitted: onSubmit,
        onSaved: onSave,
        validator: validator,
        keyboardType: textInputType,
        obscureText: isObScure ?? false,
        readOnly: readOnly,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: label,
            hintStyle: const TextStyle(color: Color(0xff7F7F7F)),
            suffixIcon: suffixIconbutton,
            fillColor: color ?? const Color(0xffFFFFFF),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColor.primaryColor)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xffBABABA)))));
  }
}
