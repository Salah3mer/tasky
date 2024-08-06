import 'package:dartz/dartz.dart';
import 'package:tasky/core/error/api_error_model.dart';
import 'package:tasky/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<ApiErrorModel, UserModel>> register({
    required String phoneNumber,
    required String password,
    required String name,
    required int experienceYears,
    required String level,
    required String address,
  });

  Future<Either<ApiErrorModel, UserModel>> login({
    required String phoneNumber,
    required String password,
  });

  Future<bool> logOut();
}
