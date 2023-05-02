import 'package:todo_list_app/app/domain/entities/task_status.dart';
import '../../core/state/result_wrapper.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Result<bool>> createTask({required TaskEntity task});
  Future<Result<void>> deleteTask({required int idTask});
  Future<Result<List<TaskEntity>>> loadTasks();
  Future<Result<void>> filterByStatusTask({required TaskStatus status});
}
