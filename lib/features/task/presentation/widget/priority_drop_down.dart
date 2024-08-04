import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/features/task/presentation/cubit/task_cubit.dart';

class PriorityDropDown extends StatelessWidget {
  final String priorty;
  const PriorityDropDown({
    super.key,
    required this.priorty,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: priorty,
      controller: TaskCubit.get(context).priorityController,
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
        DropdownMenuEntry(value: 'low', label: ' low'),
        DropdownMenuEntry(value: 'medium', label: 'medium'),
        DropdownMenuEntry(value: 'high', label: 'high'),
      ],
      leadingIcon: Icon(
        FontAwesomeIcons.flag,
        color: AppColor.primaryColor,
      ),
      hintText: 'Priority',
    );
  }
}
