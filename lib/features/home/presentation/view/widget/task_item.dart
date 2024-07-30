import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Image.network(
                  fit: BoxFit.cover,
                  'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp'),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Grocery Shopping App',
                          style: AppFonts.font24BoldColorDark(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffFFE4F2)),
                        child: Text(
                          'Waiting',
                          style: AppFonts.font12MediumColorOrange(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'This application is designed for s',
                    style: AppFonts.font14RegularColorGray(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.flag,
                        color: AppColor.primaryColor,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Medium',
                        style: AppFonts.font12MediumColorOrange(context)
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '30/12/2022',
                        style: AppFonts.font14RegularColorGray(context),
                      )
                    ],
                  )
                ],
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
          )
        ],
      ),
    );
  }
}
