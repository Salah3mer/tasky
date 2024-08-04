import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helper/widget/custom_appbar.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/task/presentation/widget/more_button.dart';
import 'package:tasky/features/task/presentation/widget/task_view_body.dart';

class TaskView extends StatelessWidget {
  final TaskModel taskModel;

  const TaskView({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, text: 'Task Details', widgets: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: MoreButton(),
        )
      ]),
      body: TaskViewBody(taskModel: taskModel),
    );
  }
}
