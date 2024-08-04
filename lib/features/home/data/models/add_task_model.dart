import 'dart:io';

class AddTaskModel {
  String image;
  String title;
  String desc;
  String priority;
  String dueDate;

  AddTaskModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'desc': desc,
        'priority': priority,
        'dueDate': dueDate,
      };
}
