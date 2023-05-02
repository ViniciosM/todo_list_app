import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_app/app/core/state/base_state.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/domain/usecases/task/load/load_tasks_usecase.dart';
import '../../../../data/models/task_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<BaseState> {
  final LoadTasksUsecase _loadTasksUsecase;

  HomeController(this._loadTasksUsecase) : super(const EmptyState());

  Future<void> loadTasks() async {
    emit(const LoadingState());
    List<TaskModel> listTasks = [];
    await Future<void>.delayed(const Duration(seconds: 2));
    var result = await _loadTasksUsecase.call();
    if (result.isSuccess) {
      for (var taskEntity in result.getSuccessData) {
        listTasks.add(TaskModel.fromEntity(taskEntity));
      }
      emit(SuccessState(listTasks));
    } else {
      emit(ErrorState(result.getErrorData.message));
    }
  }
}
