import 'package:isar/isar.dart';
import 'package:todo_list_app/app/domain/entities/task_status_entity.dart';

class TaskStatusConverter extends TypeConverter<TaskStatusEntity, int> {
  const TaskStatusConverter();

  @override
  TaskStatusEntity fromIsar(int object) {
    return TaskStatusEntity.values[object];
  }

  @override
  int toIsar(TaskStatusEntity object) {
    return object.index;
  }
}
