import 'package:todo_list_app/app/domain/entities/task_status.dart';

import '../../models/task_model.dart';

abstract class TasksLocalDatasource {
  Future<void> createTask({required TaskModel task});
  Future<void> deleteTask({required String idTask});
  Future<List<TaskModel>> loadTasks();
  Future<void> filterByStatusTask({required TaskStatus status});
}
