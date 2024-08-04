import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/utils/helper/color_helper.dart';
import 'package:tasky/core/utils/helper/widget/custom_image.dart';
import 'package:tasky/features/home/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({
    super.key,
    required this.task,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: AspectRatio(
                  aspectRatio: 1,
                  child: CustomImage(
                    imageUrl: EndPoints.imageUrl(task.image!),
                  )),
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
                          task.title!,
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
                            color: StatusColorHelper.getColor(
                                    StatusColorHelper.stringToColorName(
                                        task.status!))
                                .withOpacity(.2)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            task.status!,
                            style: AppFonts.font12MediumColorOrange(context)
                                .copyWith(
                                    color: StatusColorHelper.getColor(
                                        StatusColorHelper.stringToColorName(
                                            task.status!))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    task.desc!,
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
                        color: ColorHelper.getColor(
                            ColorHelper.stringToColorName(task.priority!)),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        task.priority!,
                        style:
                            AppFonts.font12MediumColorOrange(context).copyWith(
                          color: ColorHelper.getColor(
                              ColorHelper.stringToColorName(task.priority!)),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        task.updatedAt!.split('T').first,
                        style: AppFonts.font14RegularColorGray(context),
                      )
                    ],
                  )
                ],
              )),
          IconButton(
            alignment: AlignmentDirectional.topStart,
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
          )
        ],
      ),
    );
  }
}
