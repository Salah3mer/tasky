part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}

class HomeSuccessState extends HomeState {
  HomeSuccessState();
}

class HomeFilterListLoadingState extends HomeState {}

class HomeFilterListSuccessState extends HomeState {}

final class GetTaskByQrLoadingState extends HomeState {}

final class GetTaskByQrSuccessState extends HomeState {
  final TaskModel task;

  GetTaskByQrSuccessState({required this.task});
}

final class GetTaskByQrErrorState extends HomeState {
  final String error;

  GetTaskByQrErrorState({required this.error});
}
