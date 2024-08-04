import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/features/home/presentation/cubits/add_task_cubit/add_task_cubit.dart';

class NewTaskDropDown extends StatelessWidget {
  const NewTaskDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: 1,
      controller: AddTaskCubit.get(context).priorityController,
      trailingIcon: Icon(
        FontAwesomeIcons.caretDown,
        color: AppColor.primaryColor,
      ),
      selectedTrailingIcon: Transform.flip(
          flipY: true,
          child: Icon(
            FontAwesomeIcons.caretDown,
            color: AppColor.primaryColor,
          )),
      width: MediaQuery.sizeOf(context).width * .88,
      menuStyle:
          MenuStyle(backgroundColor: WidgetStateProperty.resolveWith((states) {
        return const Color(0xffF0ECFF);
      }), shape: WidgetStateProperty.resolveWith((state) {
        return RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: AppColor.primaryColor));
      })),
      textStyle: TextStyle(color: AppColor.primaryColor),
      inputDecorationTheme: InputDecorationTheme(
          focusColor: const Color(0xffBABABA),
          fillColor: const Color(0xffF0ECFF),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColor.primaryColor)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Color(0xffBABABA)))),
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 1, label: 'low'),
        DropdownMenuEntry(value: 2, label: 'medium'),
        DropdownMenuEntry(value: 3, label: 'high'),
      ],
      leadingIcon: Icon(
        FontAwesomeIcons.flag,
        color: AppColor.primaryColor,
      ),
      label: Text(
        'Priority',
        style: TextStyle(color: AppColor.primaryColor),
      ),
    );
  }
}
