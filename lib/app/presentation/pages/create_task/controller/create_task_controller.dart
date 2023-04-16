import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:todo_list_app/app/domain/usecases/task/create_task_usecase.dart';

import '../../../../data/models/task_model.dart';
part 'create_task_state.dart';

class CreateTaskController extends Cubit<CreateTaskStatus> {
  final CreateTaskUsecase _createTaskUsecase;

  CreateTaskController({required CreateTaskUsecase createTaskUsecase})
      : _createTaskUsecase = createTaskUsecase,
        super(CreateTaskStatus.initial);

  Future<void> createTask({required TaskModel taskModel}) async {
    try {
      emit(CreateTaskStatus.loading);
      await _createTaskUsecase.call(Params(task: taskModel));
      emit(CreateTaskStatus.success);
    } catch (e, s) {
      log('[BloC - Failed to save task]', error: e, stackTrace: s);
      emit(CreateTaskStatus.failure);
    }
  }
}
