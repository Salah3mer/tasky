import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/utils/helper/widget/costum_button.dart';
import 'package:tasky/features/home/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/view/widget/new_task_textformfield.dart';

class NewTaskViewBody extends StatelessWidget {
  const NewTaskViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  AddTaskCubit.get(context).pickImage();
                },
                child: DottedBorder(
                  dashPattern: const [8, 4],
                  strokeWidth: 1,
                  color: AppColor.primaryColor,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('Add Img',
                            style: AppFonts.font19MediumColorprimary(context))
                      ],
                    ),
                  ),
                ),
              ),
              if (AddTaskCubit.get(context).imageFile != null)
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Image(
                      image: FileImage(AddTaskCubit.get(context).imageFile!),
                      height: MediaQuery.sizeOf(context).height * .15,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.fitWidth,
                    )),
              const SizedBox(
                height: 16,
              ),
              const NewTaskTextFormFeild(),
              CustomButton(
                onTap: () {},
                text: 'Add Task',
                widthPadding: 0,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        );
      },
    );
  }
}
