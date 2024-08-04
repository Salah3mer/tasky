import 'package:dartz/dartz.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_response.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/models/user_model.dart';
import 'package:tasky/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final DioClient dioClient;

  AuthRepositoryImpl({required this.dioClient});

  @override
  Future<Either<ApiResponse, UserModel>> login(
      {required String phoneNumber, required String password}) async {
    try {
      final loginModel = LoginModel(phone: phoneNumber, password: password);
      final response = await dioClient.post(EndPoints.login, data: loginModel);
      return Right(UserModel.fromJson(response.data));
    } catch (e) {
      return Left(ApiResponse.withError(ApiErrorHandler.getMessage(e)));
    }
  }

  @override
  Future<Either<ApiResponse, UserModel>> register(
      {required String phoneNumber,
      required String password,
      required String name,
      required int experienceYears,
      required String level,
      required String address}) async {
    try {
      final register = RegisterModel(
          phone: phoneNumber,
          password: password,
          displayName: name,
          experienceYears: experienceYears,
          address: address,
          level: level);
      final response = await dioClient.post(EndPoints.register, data: register);
      return Right(UserModel.fromJson(response.data));
    } catch (e) {
      return Left(ApiResponse.withError(ApiErrorHandler.getMessage(e)));
    }
  }
}
