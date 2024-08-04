import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_response.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/features/auth/data/models/auth_error_model.dart';
import 'package:tasky/features/auth/data/models/login_model.dart';
import 'package:tasky/features/auth/data/models/register_model.dart';
import 'package:tasky/features/auth/data/models/user_model.dart';
import 'package:tasky/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final DioClient dioClient;

  AuthRepositoryImpl({required this.dioClient});

  @override
  Future<Either<AuthErrorModel, UserModel>> login(
      {required String phoneNumber, required String password}) async {
    final loginModel = LoginModel(phone: phoneNumber, password: password);

    try {
      final response = await dioClient.post(EndPoints.login, data: loginModel.toJson());

      if (response.statusCode == 422) {
        return left(AuthErrorModel.fromJson(response.data));
      } else {
        return right(UserModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      // Handle DioError separately
      if (e.response != null) {
        // Server responded with a status code that is not in the range of 2xx
        switch (e.response!.statusCode) {
          case 422:
            return left(AuthErrorModel.fromJson(e.response!.data));
          default:
            return left(AuthErrorModel(
                message:
                    'Unexpected error occurred: ${e.response!.statusMessage}'));
        }
      } else {
        // Network or other non-response errors
        return left(
            AuthErrorModel(message: 'Network error or timeout occurred'));
      }
    } catch (e) {
      // Handle other types of exceptions
      return left(AuthErrorModel(
          message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<AuthErrorModel, UserModel>> register(
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

      if (response.statusCode == 422) {
        return left(AuthErrorModel.fromJson(response.data));
      } else if (response.statusCode == 200) {
        return right(UserModel.fromJson(response.data));
      } else {
        return left(AuthErrorModel(message: 'Unknown error occurred'));
      }
    } on DioException catch (e) {
      // Handle DioError separately
      if (e.response != null) {
        // Server responded with a status code that is not in the range of 2xx
        switch (e.response!.statusCode) {
          case 422:
            return left(AuthErrorModel.fromJson(e.response!.data));
          default:
            return left(AuthErrorModel(
                message:
                    'Unexpected error occurred: ${e.response!.statusMessage}'));
        }
      } else {
        // Network or other non-response errors
        return left(
            AuthErrorModel(message: 'Network error or timeout occurred'));
      }
    } catch (e) {
      // Handle other types of exceptions
      return left(AuthErrorModel(
          message: 'An unexpected error occurred: ${e.toString()}'));
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
