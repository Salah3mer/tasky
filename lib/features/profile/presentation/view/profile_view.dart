import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helper/widget/custom_appbar.dart';
import 'package:tasky/features/profile/presentation/widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, text: 'Profile'),
      body: const ProfileViewBody(),
    );
  }
}
