import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/features/auth/presentation/view/login_view.dart';
import 'package:tasky/features/on_boarding/presentation/view/on_boarding_view.dart';

import '../../../auth/presentation/view/register_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool? onBoarding = CashHelper.getBoolean(key: AppConstans.onBoardingKey);
    var widget;
    if(onBoarding!=null){
      if(AppConstans.token==null){
        widget = Routes.loginView;
      }else{
        widget =Routes.homeView;
      }
    }else{
      widget=Routes.onBoarding;
    }

    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.pushReplacementNamed(widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
            child: SvgPicture.asset(
          AppImages.logo,
          width: 125,
          height: 50,
        )));
  }
}
