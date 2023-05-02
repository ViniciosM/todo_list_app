// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_list_app/app/core/state/result_wrapper.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';
import 'package:todo_list_app/app/domain/usecases/task/delete_task_usecase.dart';

class DeleteTaskUsecaseImpl implements DeleteTaskUsecase {
  final TaskRepository taskRepository;
  DeleteTaskUsecaseImpl({
    required this.taskRepository,
  });

  @override
  Future<Result<void>> call({required int id}) async {
    return await taskRepository.deleteTask(idTask: id);
  }
}
