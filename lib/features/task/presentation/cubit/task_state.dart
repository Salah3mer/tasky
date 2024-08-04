part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class EditTaskLoadingState extends TaskState {}

final class EditTaskSuccessState extends TaskState {}

final class EditTaskErrorState extends TaskState {
  final String error;

  EditTaskErrorState({required this.error});
}

final class DeleteTaskLoadingState extends TaskState {}

final class DeleteTaskSuccessState extends TaskState {}

final class DeleteTaskErrorState extends TaskState {
  final String error;

  DeleteTaskErrorState({required this.error});
}

