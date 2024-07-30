import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/config/styles/font_weight_helper.dart';

class TabBarItem extends StatelessWidget {
  final String tapName;
  final bool isActive;

  const TabBarItem({
    Key? key,
    required this.tapName,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:
              isActive ? AppColor.primaryColor : AppColor.tapBarContainerColor,
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          tapName,
          style: isActive
              ? AppFonts.font16BoldColorDark(context)
                  .copyWith(color: Colors.white)
              : AppFonts.font16BoldColorDark(context).copyWith(
                  fontWeight: FontWeightHelper.regular,
                  color: Color(0xff7C7C80),
                ),
        ),
      ),
    );
  }
}
