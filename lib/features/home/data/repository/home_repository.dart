import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_response.dart';
import 'package:tasky/features/home/data/models/task_model.dart';

abstract class HomeRepository {
  Future<Either<ApiResponse, String>> uploadImage(File image);

  Future<Either<ApiResponse, TaskModel>> addTask({
    required String image,
    required String title,
    required String description,
    required String dueDate,
    required String priority,
  });

  Future<Either<ApiResponse, List<TaskModel>>> getTasks({int page = 1});
  Future<Either<ApiErrorHandler, TaskModel>> getTaskByQr({required String id});
}
