import 'package:todo_list_app/app/domain/entities/task_status.dart';

import '../../domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel._({int? id, required String title, required TaskStatus status})
      : super(id: id, title: title, status: status);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel._(
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
    return TaskModel._(
        id: taskEntity.id, title: taskEntity.title, status: taskEntity.status);
  }
}
