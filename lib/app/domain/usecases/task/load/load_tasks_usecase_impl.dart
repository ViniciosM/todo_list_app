import 'package:todo_list_app/app/core/state/result_wrapper.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';
import 'package:todo_list_app/app/domain/usecases/task/load_tasks_usecase.dart';

class LoadTasksUsecaseImpl implements LoadTasksUsecase {
  final TaskRepository taskRepository;
  LoadTasksUsecaseImpl({
    required this.taskRepository,
  });

  @override
  Future<Result<List<TaskEntity>>> call() async {
    return await taskRepository.loadTasks();
  }
}
