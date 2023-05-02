import 'package:isar/isar.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';

part 'task_entity.g.dart';

@Collection()
class TaskEntity {
  Id? id;
  final String title;

  @enumerated
  TaskStatus status;

  TaskEntity({this.id, required this.title, required this.status});
}
