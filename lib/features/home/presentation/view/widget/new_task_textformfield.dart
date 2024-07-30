import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/utils/helper/widget/custom_textformfeild.dart';

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
        CustomTextFormFeild(label: 'Enter title here...'),
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
          maxLine: 6,
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
        DropdownMenu(
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
            DropdownMenuEntry(value: 1, label: 'Low'),
            DropdownMenuEntry(value: 2, label: 'Medium'),
            DropdownMenuEntry(value: 3, label: 'Hiegh'),
          ],
          leadingIcon: Icon(
            FontAwesomeIcons.flag,
            color: AppColor.primaryColor,
          ),
          label: Text(
            'Priority',
            style: TextStyle(color: AppColor.primaryColor),
          ),
          onSelected: (vlue) {},
        ),
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
          label: 'choose due date...',
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
