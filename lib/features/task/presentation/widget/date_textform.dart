import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/utils/helper/widget/custom_textformfeild.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/task/presentation/cubit/task_cubit.dart';

class DateTextForm extends StatelessWidget {
  const DateTextForm({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.8),
      child: CustomTextFormFeild(
        color: const Color(0xffF0ECFF),
        controller: TaskCubit.get(context).dueDateController =
            TextEditingController(
                text: taskModel.createdAt!.split('T').first),
        label: ' End Date...',
        validator: (value) {
          if (value!.isEmpty) {
            return 'Due date is required';
          }
          return null;
        },
        readOnly: true,
        suffixIconbutton: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.calendarDays,
              color: AppColor.primaryColor,
            )),
      ),
    );
  }
}
