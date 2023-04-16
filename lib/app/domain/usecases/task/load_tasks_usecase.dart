import 'package:dartz/dartz.dart';
import 'package:todo_list_app/app/core/exceptions/failure.dart';
import 'package:todo_list_app/app/core/generics/usecase/usecase.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';

class LoadTasksUsecase implements UseCase<List<TaskEntity>, NoParams> {
  final TaskRepository taskRepository;
  LoadTasksUsecase({
    required this.taskRepository,
  });

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) async {
    return taskRepository.loadTasks();
  }
}
