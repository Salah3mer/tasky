import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/app_images.dart';

customAppBar(context, {required String text}) => AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
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
    );
