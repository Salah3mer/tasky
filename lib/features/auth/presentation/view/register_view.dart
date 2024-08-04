import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/core/utils/helper/widget/custom_button.dart';
import 'package:tasky/features/auth/presentation/widget/already_have_account.dart';
import 'package:tasky/features/auth/presentation/widget/register_textformfield.dart';
import 'package:tasky/features/auth/presentation/widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: RegisterViewBody()),
    );
  }
}
