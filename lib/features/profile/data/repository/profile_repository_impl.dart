import 'package:dartz/dartz.dart';
import 'package:tasky/core/api/dio_client.dart';
import 'package:tasky/core/api/end_points.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_error_model.dart';
import 'package:tasky/features/profile/data/model/profile_model.dart';
import 'package:tasky/features/profile/data/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final DioClient dioClient;

  ProfileRepositoryImpl({required this.dioClient});
  @override
  Future<Either<ApiErrorModel, ProfileModel>> getProfile() async {
    try {
      final response = await dioClient.get(EndPoints.profile);
      return right(ProfileModel.fromJson(response.data));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
