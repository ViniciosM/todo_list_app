import 'package:todo_list_app/app/domain/entities/task_status.dart';

import '../../../core/state/result_wrapper.dart';

abstract class UpdateStatusTaskUsecase {
  Future<Result<void>> call({required TaskStatus status});
}
