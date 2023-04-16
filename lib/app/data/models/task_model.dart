import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
      {required super.id, required super.title, required super.status});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'], title: json['title'], status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status,
    };
  }

  factory TaskModel.fromEntity(TaskEntity taskEntity) {
    return TaskModel(
        id: taskEntity.id, title: taskEntity.title, status: taskEntity.status);
  }
}
