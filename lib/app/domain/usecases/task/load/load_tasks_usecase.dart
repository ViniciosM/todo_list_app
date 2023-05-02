import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import '../../../../core/state/result_wrapper.dart';

abstract class LoadTasksUsecase {
  Future<Result<List<TaskEntity>>> call();
}
