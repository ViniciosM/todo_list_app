import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_list_app/app/core/state/base_state.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/domain/usecases/task/create/create_task_usecase.dart';

import '../../../../data/models/task_model.dart';
part 'create_task_state.dart';

class CreateTaskController extends Cubit<BaseState> {
  final CreateTaskUsecase _createTaskUsecase;

  CreateTaskController(this._createTaskUsecase) : super(const EmptyState());

  Future<void> createTask({required TaskModel taskModel}) async {
    emit(const LoadingState());
    TaskEntity taskEntity = TaskEntity(
        id: Isar.autoIncrement,
        title: taskModel.title,
        status: TaskStatus.pending);
    var result = await _createTaskUsecase.call(taskEntity: taskEntity);
    if (result.isSuccess) {
      emit(SuccessState(result.getSuccessData));
    } else {
      emit(ErrorState(result.getErrorData.message));
    }
  }
}
