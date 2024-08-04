import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/app_images.dart';

customAppBar(context, {required String text, List<Widget>? widgets}) => AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.homeView);
        },
        child: Transform.flip(
            flipX: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AppImages.arrowIcon,
                color: Colors.black,
                fit: BoxFit.fitWidth,
              ),
            )),
      ),
      title: Text(
        text,
        style: AppFonts.font24BoldColorDark(context),
      ),
      automaticallyImplyLeading: false,
      actions: widgets,
    );
