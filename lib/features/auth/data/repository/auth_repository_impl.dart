import 'package:dartz/dartz.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_error_model.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/models/user_model.dart';
import 'package:tasky/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final DioClient dioClient;

  AuthRepositoryImpl({required this.dioClient});

  @override
  Future<Either<ApiErrorModel, UserModel>> login(
      {required String phoneNumber, required String password}) async {
    final loginModel = LoginModel(phone: phoneNumber, password: password);

    try {
      final response =
          await dioClient.post(EndPoints.login, data: loginModel.toJson());


        return right(UserModel.fromJson(response.data));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, UserModel>> register(
      {required String phoneNumber,
      required String password,
      required String name,
      required int experienceYears,
      required String level,
      required String address}) async {
    final register = RegisterModel(
      phone: phoneNumber,
      password: password,
      displayName: name,
      experienceYears: experienceYears,
      address: address,
      level: level,
    );
    try {
      final response =
          await dioClient.post(EndPoints.register, data: register.toJson());

      return right(UserModel.fromJson(response.data));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      final response = await dioClient
          .post(EndPoints.logOut, data: {'token': AppConstans.reFreshtoken});

      return response.data['success'];
    } catch (e) {
      return false;
    }
  }
}
