import 'dart:developer';
import 'package:isar/isar.dart';
import 'package:todo_list_app/app/data/datasources/task/tasks_local_datasource.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';

import '../../../core/database/local/database.dart';
import '../../../core/exceptions/failure.dart';

class TasksLocalDatasourceImpl implements TasksLocalDatasource {
  final Database _database;

  TasksLocalDatasourceImpl({required Database database}) : _database = database;

  @override
  Future<bool> createTask({required TaskModel task}) async {
    try {
      final connection = await _database.openConnection();

      TaskEntity taskEntity = TaskEntity(
          id: Isar.autoIncrement, title: task.title, status: task.status);
      await connection.writeTxn(() async {
        await connection.taskEntitys.put(taskEntity);
      });

      return true;
    } on IsarError catch (e, s) {
      log('[DATASOURCE LOCAL] - FAILED TO CREATE A NEW TASK',
          error: e, stackTrace: s);

      throw Failure(message: 'Error when create a new task');
    }
  }

  @override
  Future<void> deleteTask({required String idTask}) async {
    try {
      final connection = await _database.openConnection();

      await connection.taskEntitys.delete(int.parse(idTask));
    } on IsarError catch (e, s) {
      log('[DATASOURCE LOCAL] - FAILED TO DELETE TASK',
          error: e, stackTrace: s);
      throw Failure(message: 'Error when delete task');
    }
  }

  @override
  Future<List<TaskModel>> loadTasks() async {
    try {
      final connection = await _database.openConnection();
      List<TaskModel> listTask = [];
      List<TaskEntity> tasks = await connection.taskEntitys
          .filter()
          .statusEqualTo(TaskStatus.pending)
          .or()
          .statusEqualTo(TaskStatus.done)
          .findAll();

      for (TaskEntity t in tasks) {
        listTask.add(TaskModel.fromEntity(t));
      }

      return listTask;
    } on IsarError catch (e, s) {
      log('[DATASOURCE LOCAL] - FAILED TO LOAD TASKS', error: e, stackTrace: s);
      throw Failure(message: 'Error when load tasks');
    }
  }

  @override
  Future<List<TaskModel>> filterByStatusTask(
      {required TaskStatus status}) async {
    try {
      final connection = await _database.openConnection();
      List<TaskModel> listTask = [];
      List<TaskEntity> tasks =
          await connection.taskEntitys.filter().statusEqualTo(status).findAll();

      for (TaskEntity t in tasks) {
        listTask.add(TaskModel.fromEntity(t));
      }

      return listTask;
    } on IsarError catch (e, s) {
      log('[DATASOURCE LOCAL] - FAILED TO LOAD TASKS', error: e, stackTrace: s);

      throw Failure(message: 'Error when filter tasks');
    }
  }

  @override
  Future<void> updateTask({required TaskModel task}) async {
    try {
      final connection = await _database.openConnection();
      var newStatus =
          task.status == TaskStatus.done ? TaskStatus.pending : TaskStatus.done;
      final taskEntity = TaskEntity(title: task.title, status: newStatus);
      await connection.writeTxn(() async {
        await connection.taskEntitys.put(taskEntity);
      });
    } on IsarError catch (e, s) {
      log('[DATASOURCE LOCAL] - FAILED TO UPDATE TASK',
          error: e, stackTrace: s);

      throw Failure(message: 'Error when update task');
    }
  }
}
