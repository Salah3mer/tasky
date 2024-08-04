import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/utils/helper/widget/custom_button.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';
import 'package:tasky/features/home/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/widget/new_task_textformfield.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class NewTaskViewBody extends StatelessWidget {
  const NewTaskViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccessState) {
          showTopSnackBar(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Good job, New Task Added successfuly. Have a nice day",
            ),
          );
          context.pushReplacementNamed(Routes.homeView);
        } else if (state is AddTaskErrorState) {
          showTopSnackBar(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              Overlay.of(context),
              CustomSnackBar.error(
                  maxLines: 5,
                  message:
                      'There is some information. You need to do something with that${state.error}'));
        } else if (state is UploadImageErrorState) {
          showTopSnackBar(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              Overlay.of(context),
              CustomSnackBar.error(
                  maxLines: 5,
                  message:
                      'Error while uploading image: ${state.error} , please pick new image'));
        }
      },
      builder: (context, state) {
        return Form(
          key: AddTaskCubit.get(context).formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () async {
                    await AddTaskCubit.get(context)
                        .pickImage()
                        .then((val) async {
                      await AddTaskCubit.get(context).uploadImage();
                    });
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
                state is AddTaskLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onTap: () async {
                          if (AddTaskCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate() &&
                              AddTaskCubit.get(context).path.isNotEmpty) {
                            await AddTaskCubit.get(context).addTask();
                          } else {
                            showTopSnackBar(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                Overlay.of(context),
                                const CustomSnackBar.error(
                                    maxLines: 5,
                                    message: ' please pick image'));
                          }
                        },
                        text: 'Add Task',
                        widthPadding: 0,
                      ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
