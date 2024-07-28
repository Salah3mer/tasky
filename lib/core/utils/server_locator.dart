import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/core/utils/api/dio_client.dart';
import 'package:tasky/core/utils/api/logging_interceptor.dart';
import 'package:tasky/features/auth/data/repository/auth_repository_impl.dart';

final getIt = GetIt.instance;

getItSetup() {
  // Core

  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(
      () => DioClient(getIt(), loggingInterceptor: getIt()));

  getIt.registerSingleton<AuthRepositoryImpl>(
      AuthRepositoryImpl(dioClient: getIt()));
}
