import 'package:todo_list_app/app/domain/entities/task_status.dart';

import '../../models/task_model.dart';

abstract class TasksLocalDatasource {
  Future<bool> createTask({required TaskModel task});
  Future<void> deleteTask({required String idTask});
  Future<List<TaskModel>> loadTasks();
  Future<List<TaskModel>> filterByStatusTask({required TaskStatus status});
  Future<void> updateTask({required TaskModel task});
}
