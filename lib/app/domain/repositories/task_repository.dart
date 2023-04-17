import 'package:dartz/dartz.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import '../../core/exceptions/failure.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, void>> createTask({required TaskEntity task});
  Future<Either<Failure, void>> deleteTask({required String idTask});
  Future<Either<Failure, List<TaskEntity>>> loadTasks();
  Future<Either<Failure, void>> filterByStatusTask(
      {required TaskStatus status});
}
