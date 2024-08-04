import 'package:dartz/dartz.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_response.dart';
import 'package:tasky/features/home/data/models/task_model.dart';

abstract class TaskRepository {
  Future<Either<ApiResponse, TaskModel>> editTask(
      {required String id,
      required String user,
      required String title,
      required String desc,
      required String status,
      required String imageUrl,
      required String priority});
  Future<Either<ApiErrorHandler , TaskModel>> deleteTask({required String id});
}
