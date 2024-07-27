import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/view/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: LoginViewBody(),
      ),
    );
  }
}
