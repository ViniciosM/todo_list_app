import '../models/task_model.dart';

abstract class TasksLocalDataDatasource {
  Future<void> createTask({required TaskModel task});
  Future<void> deleteTask({required String idTask});
  Future<List<TaskModel>> loadTasks();
  Future<void> updateStatusTask({required TaskModel task});
}
