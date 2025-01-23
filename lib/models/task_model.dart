class TaskModel {
  TaskModel({
    this.id,
    this.task,
    this.isCompleted,
    this.isDeleted,
    this.description,
  });

  final int? id;
  final String? task;
  final String? description;
  bool? isCompleted;
  bool? isDeleted;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      task: json['task'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      isDeleted: json['isDeleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'description': description,
      'isCompleted': isCompleted,
      'isDeleted': isDeleted,
    };
  }
}
