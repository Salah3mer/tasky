part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterIsObScureSuccessState extends RegisterState {}
final class RegisterIsObScureLoadingState extends RegisterState {}
final class RegisterLoadingState extends RegisterState {}
final class RegisterSuccessState extends RegisterState {
  final UserModel userModel;

  RegisterSuccessState({required this.userModel});
}
final class RegisterErrorState extends RegisterState {
  final  String error ;

  RegisterErrorState({required this.error});
}
