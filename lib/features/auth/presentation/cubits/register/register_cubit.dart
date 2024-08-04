import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasky/features/auth/data/models/user_model.dart';
import 'package:tasky/features/auth/data/repository/auth_repository_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepositoryImpl authRepository;

  RegisterCubit(this.authRepository) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController experinceController = TextEditingController();
  TextEditingController experincelevelController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isObScure = true;

  void changeEyeState() {
    emit(RegisterIsObScureLoadingState());
    isObScure = !isObScure;
    emit(RegisterIsObScureSuccessState());
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    final response = await authRepository.register(
        phoneNumber: phoneController.text,
        password: passwordController.text,
        name: nameController.text,
        experienceYears: int.parse(experinceController.text),
        level: experincelevelController.text,
        address: addressController.text);
    response.fold(
        (error) => emit(RegisterErrorState(error: error.message.toString())),
        (user) => emit(RegisterSuccessState(userModel: user)));
  }
}
