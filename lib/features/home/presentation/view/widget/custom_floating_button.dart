import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';

class CustomFloatingButtons extends StatelessWidget {
  const CustomFloatingButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            radius: 28,
            splashColor: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: CircleAvatar(
                backgroundColor: AppColor.secFloatingActionButton,
                radius: 28,
                child: Icon(
                  FontAwesomeIcons.qrcode,
                  color: AppColor.primaryColor,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            splashColor: Colors.deepPurple,
            radius: 32,
            borderRadius: BorderRadius.circular(24),
            hoverColor: Colors.deepPurple,
            onTap: () {
              context.pushNamed(Routes.newTask);
            },
            child: CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                radius: 32,
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
