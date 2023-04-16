import 'package:equatable/equatable.dart';
import 'package:todo_list_app/app/domain/entities/task_status_entity.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final TaskStatusEntity status;

  const TaskEntity(
      {required this.id, required this.title, required this.status});

  @override
  List<Object> get props => [id, title, status];
}
