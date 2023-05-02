// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';
import 'package:todo_list_app/app/domain/usecases/task/update_status_task_usecase.dart';

import '../../../core/state/result_wrapper.dart';

class UpdateStatusTaskUsecaseImpl implements UpdateStatusTaskUsecase {
  final TaskRepository taskRepository;
  UpdateStatusTaskUsecaseImpl({
    required this.taskRepository,
  });

  @override
  Future<Result<void>> call({required TaskStatus status}) async {
    return await taskRepository.filterByStatusTask(status: status);
  }
}
