import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/core/utils/helper/shimmer/shimmer_list.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/widget/task_item.dart';
import 'package:tasky/features/task/presentation/cubit/task_cubit.dart';

class TaskListView extends StatelessWidget {
  final List<TaskModel> tasks;
  const TaskListView({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (HomeCubit.get(context).tasksList.isNotEmpty) {
          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.pushNamed(Routes.task, arguments: tasks[index]);
                  },
                  child: TaskItem(task: tasks[index])),
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: tasks.length);
        } else if (HomeCubit.get(context).tasksList.isEmpty) {
          return const SizedBox();
        } else {
          return const ShimmerListPlaceHolder();
        }
      },
    );
  }
}
