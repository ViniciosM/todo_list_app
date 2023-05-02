import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/core/state/result_wrapper.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';
import 'package:todo_list_app/app/domain/usecases/task/create_task_usecase.dart';

class CreateTaskUsecaseImpl implements CreateTaskUsecase {
  final TaskRepository taskRepository;

  CreateTaskUsecaseImpl({required this.taskRepository});

  @override
  Future<Result<bool>> call({required TaskEntity taskEntity}) async {
    return await taskRepository.createTask(task: taskEntity);
  }
}
