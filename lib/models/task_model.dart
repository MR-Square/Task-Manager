class TaskModel {
  const TaskModel({
    this.id,
    this.task,
    this.isCompleted,
    this.isDeleted,
  });

  final int? id;
  final String? task;
  final bool? isCompleted;
  final bool? isDeleted;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: int.tryParse(json['id']),
      task: json['task'],
      isCompleted: bool.tryParse(json['isCompleted']),
      isDeleted: bool.tryParse(json['isDeleted']),
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
