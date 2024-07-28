import 'package:dartz/dartz.dart';
import 'package:tasky/core/utils/error/api_response.dart';
import 'package:tasky/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<ApiResponse, UserModel>> register({
    required String phoneNumber,
    required String password,
    required String name,
    required int experienceYears,
    required String level,
    required String address,
  });

  Future<Either<ApiResponse, UserModel>> login({
    required String phoneNumber,
    required String password,
  });

  Future<void> refeshToken({required String token});
}
