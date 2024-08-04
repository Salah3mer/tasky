import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helper/widget/custom_appbar.dart';
import 'package:tasky/features/home/presentation/widget/new_task_view_body.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, text: 'Add New Task'),
      body: const SingleChildScrollView(
        child: NewTaskViewBody(),
      ),
    );
  }
}
