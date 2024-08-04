import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/data/repository/home_repository_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryImpl homeRepositoryImpl;
  HomeCubit(this.homeRepositoryImpl) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int page = 1;
  List<TaskModel> tasksList = [];
  Future<void> getTasks() async {
    emit(HomeLoadingState());
    final response = await homeRepositoryImpl.getTasks(page: page);

    response.fold((error) => emit(HomeErrorState(errorMessage: error.error)),
        (tasks) {
      if (tasks.isNotEmpty) {
        page++;
      }
      tasksList.addAll(tasks);
      emit(HomeSuccessState());
    });
  }

  List<TaskModel> filterdList = [];
  void getFilterList(String? status) {
    emit(HomeFilterListLoadingState());
    if (status == 'all') {
      filterdList = tasksList;
      emit(HomeFilterListSuccessState());
    } else {
      filterdList = tasksList.where((task) => task.status == status).toList();
      emit(HomeFilterListSuccessState());
    }
  }

  TaskModel? qrTask;
  Future<void> getTaskByQr({required String qrID}) async {
    emit(GetTaskByQrLoadingState());
    final response = await homeRepositoryImpl.getTaskByQr(id: qrID);
    response.fold(
      (error) => emit(GetTaskByQrErrorState(error: error.toString())),
      (task) {
        qrTask = task;
        emit(GetTaskByQrSuccessState(task: task));
      },
    );
  }
}
