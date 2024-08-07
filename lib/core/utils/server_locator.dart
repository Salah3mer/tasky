import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/logging_interceptor.dart';
import 'package:tasky/features/auth/data/repository/auth_repository_impl.dart';
import 'package:tasky/features/home/data/repository/home_repository_impl.dart';
import 'package:tasky/features/profile/data/repository/profile_repository_impl.dart';
import 'package:tasky/features/task/data/repository/task_repository_impl.dart';

final getIt = GetIt.instance;

getItSetup() {
  // Core

  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt()));

  getIt.registerSingleton<AuthRepositoryImpl>(
      AuthRepositoryImpl(dioClient: getIt()));

  getIt.registerSingleton<HomeRepositoryImpl>(
      HomeRepositoryImpl(dioClient: getIt()));
  getIt.registerSingleton<TaskRepositoryImpl>(
      TaskRepositoryImpl(dioClient: getIt()));
  getIt.registerSingleton<ProfileRepositoryImpl>(
      ProfileRepositoryImpl(dioClient: getIt()));
}
