import 'package:dartz/dartz.dart';
import 'package:tasky/core/error/api_response.dart';
import 'package:tasky/features/auth/data/models/auth_error_model.dart';
import 'package:tasky/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<AuthErrorModel, UserModel>> register({
    required String phoneNumber,
    required String password,
    required String name,
    required int experienceYears,
    required String level,
    required String address,
  });

  Future<Either<AuthErrorModel, UserModel>> login({
    required String phoneNumber,
    required String password,
  });

  Future<bool> logOut();
}
