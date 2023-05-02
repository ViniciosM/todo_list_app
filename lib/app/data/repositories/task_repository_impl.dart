import 'package:todo_list_app/app/core/state/base_error.dart';
import 'package:todo_list_app/app/core/state/result_wrapper.dart';
import 'package:todo_list_app/app/data/datasources/task/tasks_local_datasource.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TasksLocalDatasource tasksLocalDatasource;

  TaskRepositoryImpl({required this.tasksLocalDatasource});

  @override
  Future<Result<bool>> createTask({required TaskEntity task}) async {
    final taskModel = TaskModel.fromEntity(task);

    try {
      await tasksLocalDatasource.createTask(task: taskModel);

      return ResultSuccess(true);
    } catch (e) {
      return ResultError(
          BaseError('[REPOSITORY] - Could not create a task - $e'));
    }
  }

  @override
  Future<Result<void>> deleteTask({required int idTask}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> filterByStatusTask({required TaskStatus status}) {
    // TODO: implement filterByStatusTask
    throw UnimplementedError();
  }

  @override
  Future<Result<List<TaskEntity>>> loadTasks() async {
    try {
      var result = await tasksLocalDatasource.loadTasks();

      return ResultSuccess(result);
    } catch (e) {
      return ResultError(BaseError('[REPOSITORY] - Could not load tasks - $e'));
    }
  }
}
