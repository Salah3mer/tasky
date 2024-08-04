class TaskModel {
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  TaskModel({
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.user,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        image: json['image'] as String?,
        title: json['title'] as String?,
        desc: json['desc'] as String?,
        priority: json['priority'] as String?,
        status: json['status'] as String?,
        user: json['user'] as String?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'desc': desc,
        'priority': priority,
        'status': status,
        'user': user,
        '_id': id,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
