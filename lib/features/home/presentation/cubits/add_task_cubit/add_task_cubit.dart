import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  static AddTaskCubit get(context) => BlocProvider.of(context);

  File? imageFile;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (image != null) {
      imageFile = File(image.path);
      List<int> imageBytes = imageFile!.readAsBytesSync();
      final base64Image = base64Encode(imageBytes);
      emit(PickImageSuccessState());
    }
  }
}
