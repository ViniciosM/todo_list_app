import 'package:todo_list_app/app/data/datasources/task/tasks_local_datasource.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TasksLocalDatasource tasksLocalDatasource;

  TaskRepositoryImpl({required this.tasksLocalDatasource});

  @override
  Future<Either<Failure, void>> createTask({required TaskEntity task}) async {
    final taskModel = TaskModel.fromEntity(task);

    try {
      final result = await tasksLocalDatasource.createTask(task: taskModel);
      return Right(result);
    } on Failure {
      return Left(Failure(message: '[REPOSITORY] - Could not create a task'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask({required String idTask}) async {
    try {
      final result = await tasksLocalDatasource.deleteTask(idTask: idTask);
      return Right(result);
    } on Failure {
      return Left(Failure(message: '[REPOSITORY] - Could not delete a task'));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> loadTasks() async {
    try {
      var result = await tasksLocalDatasource.loadTasks();

      return Right(result);
    } on Failure {
      return Left(Failure(message: '[REPOSITORY] - Could not load tasks'));
    }
  }

  @override
  Future<Either<Failure, void>> filterByStatusTask(
      {required TaskStatus status}) async {
    //final taskModel = TaskModel.fromEntity(ta);
    try {
      final result =
          await tasksLocalDatasource.filterByStatusTask(status: status);
      return Right(result);
    } on Failure {
      return Left(
          Failure(message: '[REPOSITORY] - Could not filter tasks by status'));
    }
  }
}
