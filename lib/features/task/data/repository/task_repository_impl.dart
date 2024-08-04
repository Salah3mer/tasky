import 'package:dartz/dartz.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_response.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/task/data/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final DioClient dioClient;

  TaskRepositoryImpl({required this.dioClient});

  @override
  Future<Either<ApiErrorHandler, TaskModel>> deleteTask(
      {required String id}) async {
    try {
      final response = await dioClient.delete(EndPoints.todos + id);

      return right(TaskModel.fromJson(response.data));
    } catch (e) {
      return left(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<Either<ApiResponse, TaskModel>> editTask(
      {required String id,
      required String user,
      required String status,
      required String imageUrl,
      required String priority,
      required String title,
      required String desc}) async {
    try {
      final response = await dioClient.put(EndPoints.todos + id, data: {
        'image': imageUrl,
        'title': title,
        'user': user,
        'desc': desc,
        'priority': priority,
        'status': status
      });

      return right(TaskModel.fromJson(response.data));
    } catch (e) {
      return left(ApiResponse.withError(ApiErrorHandler.getMessage(e)));
    }
  }
}
