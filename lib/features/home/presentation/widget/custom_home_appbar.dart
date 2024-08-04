import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/app_images.dart';
import 'package:tasky/features/auth/presentation/cubits/login/login_cubit.dart';

customHomeAppBar(context) => AppBar(
      leadingWidth: 90,
      leading: Container(
        margin: const EdgeInsetsDirectional.only(start: 22.0),
        child: SvgPicture.asset(
          AppImages.logo,
          color: Colors.black87,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.circleUser),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowRightFromBracket,
            color: AppColor.primaryColor,
          ),
          onPressed: () {
            LoginCubit.get(context).logOut(context);
          },
        ),
        const SizedBox(
          width: 22,
        )
      ],
    );
