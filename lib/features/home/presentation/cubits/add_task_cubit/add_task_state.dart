part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class PickImageSuccessState extends AddTaskState {}

final class AddTaskLoadingState extends AddTaskState {}

final class AddTaskSuccessState extends AddTaskState {}

final class AddTaskErrorState extends AddTaskState {
  final String error;

  AddTaskErrorState({required this.error});
}

final class UploadImageErrorState extends AddTaskState {
  final String error;

  UploadImageErrorState({required this.error});
}

final class UploadImageLoadingState extends AddTaskState {}

final class UploadImageSuccessState extends AddTaskState {}
