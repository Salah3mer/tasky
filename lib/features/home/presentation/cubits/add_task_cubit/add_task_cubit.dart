import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:tasky/features/home/data/repository/home_repository_impl.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final HomeRepositoryImpl homeRepositoryImpl;

  AddTaskCubit(
    this.homeRepositoryImpl,
  ) : super(AddTaskInitial());

  static AddTaskCubit get(context) => BlocProvider.of(context);

  File? imageFile;
  String path = '';

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (image != null) {
      imageFile = File(image.path);
      // List<int> imageBytes = imageFile!.readAsBytesSync();
      // final base64Image = base64Encode(imageBytes);
      // await uploadImage();
      emit(PickImageSuccessState());
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  Future<void> addTask() async {
    emit(AddTaskLoadingState());
    final response = await homeRepositoryImpl.addTask(
        image: path,
        title: titleController.text,
        description: descriptionController.text,
        dueDate: dueDateController.text,
        priority: priorityController.text);

    response.fold((error) => emit(AddTaskErrorState(error: error.toString())),
        (task) => emit(AddTaskSuccessState()));
  }

  Future<void> uploadImage() async {
    path = '';
    emit(UploadImageLoadingState());
    final response = await homeRepositoryImpl.uploadImage(imageFile!);
    response.fold((error) => emit(UploadImageErrorState(error: error.error)),
        (image) {
      path = image;
      emit(UploadImageSuccessState());
    });
  }
}
