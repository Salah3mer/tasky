part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginIsObScureLoadingState extends LoginState {}

final class LoginIsObScureSuccessState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}

final class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}
