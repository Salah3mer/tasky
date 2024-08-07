import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_response.dart';
import 'package:tasky/features/home/data/models/add_task_model.dart';
import 'package:tasky/features/home/data/models/task_model.dart';
import 'package:tasky/features/home/data/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final DioClient dioClient;

  HomeRepositoryImpl({required this.dioClient});

  @override
  Future<Either<ApiResponse, TaskModel>> addTask(
      {required String image,
      required String title,
      required String description,
      required String dueDate,
      required String priority}) async {
    try {
      final addTask = AddTaskModel(
          image: image,
          title: title,
          desc: description,
          priority: priority,
          dueDate: dueDate);
      final response =
          await dioClient.post(EndPoints.addTask, data: addTask.toJson());

      return right(TaskModel.fromJson(response.data));
    } catch (e) {
      return left(ApiResponse.withError(ApiErrorHandler.handle(e)));
    }
  }

  @override
  Future<Either<ApiResponse, String>> uploadImage(File image) async {
    try {
      FormData fromData = FormData();
      fromData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
            contentType:
                DioMediaType.parse("image/${image.path.split('.').last}"),
          )));

      final response =
          await dioClient.post(EndPoints.uploadImage, data: fromData);
      return right(response.data['image']);
    } catch (e) {
      return left(ApiResponse.withError(ApiErrorHandler.handle(e.toString())));
    }
  }

  @override
  Future<Either<ApiResponse, List<TaskModel>>> getTasks({int page = 1}) async {
    try {
      final response = await dioClient.get('${EndPoints.tasks}$page');
      return right(
          List.from(response.data.map((json) => TaskModel.fromJson(json))));
    } catch (e) {
      return left(ApiResponse.withError(ApiErrorHandler.handle(e)));
    }
  }

  @override
  Future<Either<ApiErrorHandler, TaskModel>> getTaskByQr(
      {required String id}) async {
    try {
      final response = await dioClient.get(EndPoints.todos + id);

      return right(TaskModel.fromJson(response.data));
    } catch (e) {
      return left(ApiErrorHandler.handle(e) as ApiErrorHandler);
    }
  }
}
