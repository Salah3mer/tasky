import 'package:dartz/dartz.dart';
import 'package:tasky/core/error/api_error_handler.dart';
import 'package:tasky/core/error/api_error_model.dart';
import 'package:tasky/features/profile/data/model/profile_model.dart';

abstract class ProfileRepository{
Future<Either <ApiErrorModel, ProfileModel>> getProfile();
}