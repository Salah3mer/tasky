
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_fonts.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/task/presentation/cubit/task_cubit.dart';
import 'package:tasky/features/task/presentation/widget/date_textform.dart';
import 'package:tasky/features/task/presentation/widget/priority_drop_down.dart';
import 'package:tasky/features/task/presentation/widget/status_drop_down.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


class TaskViewBody extends StatelessWidget {
  const TaskViewBody({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is EditTaskSuccessState) {
          showTopSnackBar(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Good job, your Edit is successful. Have a nice day",
            ),
          );
          context.pushReplacementNamed(Routes.homeView);
        } else if (state is EditTaskErrorState) {
          showTopSnackBar(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              Overlay.of(context),
              CustomSnackBar.error(
                  maxLines: 5,
                  message:
                      'There is some information. You need to do something with that${state.error}'));
        } else if (state is DeleteTaskErrorState) {
          showTopSnackBar(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              Overlay.of(context),
              CustomSnackBar.error(
                  maxLines: 5,
                  message:
                      'There is some information. You need to do something with that${state.error}'));
        } else if (state is DeleteTaskSuccessState) {
          showTopSnackBar(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            Overlay.of(context),
            const CustomSnackBar.success(
              message:
                  "Good job, your Task Deleted  successfuly. Have a nice day",
            ),
          );
          context.pushReplacementNamed(Routes.homeView);
        }
      },
      builder: (context, state) {
        TaskCubit.get(context).task = taskModel;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
                width: double.infinity,
                child: Image.network(
                  EndPoints.imageUrl(taskModel.image!),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title!,
                      style: AppFonts.font24BoldColorDark(context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      taskModel.desc!,
                      textAlign: TextAlign.start,
                      style: AppFonts.font14RegularColorGray(context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DateTextForm(taskModel: taskModel),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusDropDown(
                      status: taskModel.status!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PriorityDropDown(priorty: taskModel.priority!),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        height: 300,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: QrImageView(
                            data: taskModel.id!,
                            version: QrVersions.auto,
                            gapless: false,
                            backgroundColor: Colors.white,
                            errorCorrectionLevel: QrErrorCorrectLevel
                                .L, // Error correction level: L, M, Q, H
                          ),
                        ),
                      ),
                    ),
    
                       const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

