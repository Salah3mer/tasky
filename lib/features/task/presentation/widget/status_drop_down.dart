import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/features/task/presentation/cubit/task_cubit.dart';

class StatusDropDown extends StatelessWidget {
  final String status;
  const StatusDropDown({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        initialSelection: status,
         controller: TaskCubit.get(context).statusController,
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
        menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
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
          DropdownMenuEntry(value: 'waiting', label: 'waiting'),
          DropdownMenuEntry(value: 'inprogress', label: 'inprogress'),
          DropdownMenuEntry(value: 'finished', label: 'finished'),
        ],
        hintText: 'Status',
        leadingIcon: const SizedBox());
  }
}
