import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';

class CustomProfileContainerWidget extends StatelessWidget {
  final String name, text;
  final bool isPhone;
  const CustomProfileContainerWidget({
    super.key,
    required this.name,
    required this.text,
    this.isPhone = false,
  });

  @override
  Widget build(BuildContext context) {
    return isPhone
        ? Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF5F5F5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppFonts.font13RegularColorGray(context),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        text,
                        style: AppFonts.font16BoldColorDark(context)
                            .copyWith(color: const Color(0xff2F2F2F)),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: text));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Text Copied to ClipBoard')));
                      },
                      icon: Icon(
                        FontAwesomeIcons.clone,
                        color: AppColor.primaryColor,
                      ))
                ],
              ),
            ))
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF5F5F5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppFonts.font13RegularColorGray(context),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$text ',
                    style: AppFonts.font16BoldColorDark(context)
                        .copyWith(color: const Color(0xff2F2F2F)),
                  )
                ],
              ),
            ));
  }
}
