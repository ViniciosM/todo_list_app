import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({super.id, required super.title, required super.isDone});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'], title: json['title'], isDone: json['isDone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromEntity(TaskEntity taskEntity) {
    return TaskModel(
        id: taskEntity.id, title: taskEntity.title, isDone: taskEntity.isDone);
  }
}
