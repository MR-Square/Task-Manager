class TaskModel {
  TaskModel({
    this.id,
    this.task,
    this.isCompleted,
    this.isDeleted,
  });

  final int? id;
  final String? task;
  bool? isCompleted;
  bool? isDeleted;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      task: json['task'],
      isCompleted: json['isCompleted'],
      isDeleted: json['isDeleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'isCompleted': isCompleted,
      'isDeleted': isDeleted,
    };
  }
}
