import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/task/data/repository/task_repository_impl.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepositoryImpl taskRepositoryImpl;
  TaskCubit(this.taskRepositoryImpl) : super(TaskInitial());
  static TaskCubit get(context) => BlocProvider.of(context);

  TaskModel? task;
  TextEditingController statusController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController priorityController = TextEditingController();

  Future<void> editTask() async {
    final response = await taskRepositoryImpl.editTask(
        id: task!.id!,
        user: task!.user!,
        status: statusController.text,
        imageUrl: task!.image!,
        priority: priorityController.text,
        title: task!.title!,
        desc: task!.desc!);

    response.fold(
      (error) => emit(EditTaskErrorState(error: error.error)),
      (task) => emit(EditTaskSuccessState()),
    );
  }

  Future<void> deleteTask() async {
    final response = await taskRepositoryImpl.deleteTask(id: task!.id!);
    response.fold(
      (error) => emit(DeleteTaskErrorState(error: error.toString())),
      (task) => emit(DeleteTaskSuccessState()),
    );
  }


}
