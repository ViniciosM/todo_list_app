import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import '../../../core/state/result_wrapper.dart';

abstract class CreateTaskUsecase {
  Future<Result<bool>> call({required TaskEntity taskEntity});
}
