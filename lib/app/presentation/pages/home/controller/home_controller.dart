import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_app/app/core/generics/usecase/usecase.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/domain/usecases/task/load_tasks_usecase.dart';
import 'package:todo_list_app/app/domain/usecases/task/update_status_task_usecase.dart';

import '../../../../data/models/task_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final LoadTasksUsecase _loadTasksUsecase;
  final UpdateStatusTaskUsecase _updateStatusTaskUsecase;

  HomeController(
      {required LoadTasksUsecase loadTasksUsecase,
      required UpdateStatusTaskUsecase updateStatusTaskUsecase})
      : _loadTasksUsecase = loadTasksUsecase,
        _updateStatusTaskUsecase = updateStatusTaskUsecase,
        super(HomeState.initial());

  Future<void> loadTasks() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final tasks = await _loadTasksUsecase.call(NoParams());

      List<TaskModel> listTasks = [];

      tasks.fold(
        (failure) => emit(state.copyWith(status: HomeStatus.failure)),
        (response) {
          for (var task in response) {
            listTasks.add(TaskModel.fromEntity(task));
          }
          emit(state.copyWith(status: HomeStatus.complete, tasks: listTasks));
        },
      );
    } catch (e, s) {
      log('Error when load tasks', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  // Future<void> filter(TaskStatus status) async {
  //   emit(state.copyWith(status: HomeStatus.loading, projects: []));
  //   final tasks = await _updateStatusTaskUsecase.call(Params(status: status));
  //   emit(state.copyWith(
  //       status: HomeStatus.complete, tasks: tasks, taskStatus: status));
  // }

  // Future<void> updateList() async {
  //   if (state.status == HomeStatus.complete) {
  //     filter(state.projectFilter);
  //   } else {
  //     filter(ProjectStatus.em_andamento);
  //   }
  // }
}
