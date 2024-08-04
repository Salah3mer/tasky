import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/utils/helper/widget/custom_textformfeild.dart';
import 'package:tasky/features/home/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/widget/new_task_drop_down.dart';

class NewTaskTextFormFeild extends StatelessWidget {
  const NewTaskTextFormFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task title',
          style: AppFonts.font13RegularColorGray(context),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormFeild(
          label: 'Enter title here...',
          controller: AddTaskCubit.get(context).titleController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Title is required';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Task Description',
          style: AppFonts.font13RegularColorGray(context),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormFeild(
          label: 'Enter description here...',
          controller: AddTaskCubit.get(context).descriptionController,
          maxLine: 6,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Description is required';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Priority',
          style: AppFonts.font13RegularColorGray(context),
        ),
        const SizedBox(
          height: 10,
        ),
        const NewTaskDropDown(),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Due date',
          style: AppFonts.font13RegularColorGray(context),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormFeild(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: AddTaskCubit.get(context).selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(3000),
            ).then((value) {
              if (value != null) {
                AddTaskCubit.get(context).selectedDate = value;
                AddTaskCubit.get(context).dueDateController.text =
                    '${AddTaskCubit.get(context).selectedDate.day}/${AddTaskCubit.get(context).selectedDate.month}/${AddTaskCubit.get(context).selectedDate.year}';
              }
            });
          },
          label: 'choose due date...',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Due date is required';
            }
            return null;
          },
          readOnly: true,
          controller: AddTaskCubit.get(context).dueDateController,
          suffixIconbutton: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.calendarDays,
                color: AppColor.primaryColor,
              )),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
