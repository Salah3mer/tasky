import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/core/error/api_error_model.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';

import 'package:tasky/features/auth/data/models/user_model.dart';
import 'package:tasky/features/auth/data/repository/auth_repository_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepositoryImpl authRepository;
  LoginCubit(this.authRepository) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isObScure = true;

  void changeEyeState() {
    emit(LoginIsObScureLoadingState());
    isObScure = !isObScure;
    emit(LoginIsObScureSuccessState());
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    final response = await authRepository.login(
        phoneNumber: phoneController.text, password: passwordController.text);
    response.fold((error) => emit(LoginErrorState(error: error)),
        (user) => emit(LoginSuccessState(userModel: user)));
  }

  Future<void> logOut(context) async {
    final responce = await authRepository.logOut();
    if (responce) {
      CashHelper.removeData(key: AppConstans.tokenKey);
      CashHelper.removeData(key: AppConstans.reFreshtokenKey);

      Navigator.pushReplacementNamed(context, Routes.loginView);

      emit(LogOutSuccessState());
    } else {
      emit(LogOutErrorState());
    }
  }
}
