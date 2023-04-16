import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_app/app/data/datasources/task/tasks_local_datasource.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';

import '../local/db_local.dart';

class TasksLocalDatasourceImpl implements TasksLocalDatasource {
  final DBLocal dbLocal;

  TasksLocalDatasourceImpl({required this.dbLocal});

  @override
  Future<void> createTask({required TaskModel task}) async {
    try {
      await dbLocal.openDB();
      await dbLocal.saveTask(task: task);
      debugPrint('[DATASOURCE LOCAL] - DATABASE IS NOT OPEN - Error: $e');
    } catch (e) {
      debugPrint('[DATASOURCE LOCAL] - FAILED TO SAVE TASK - Error: $e');
    }
  }

  @override
  Future<void> deleteTask({required String idTask}) async {
    //todo
  }

  @override
  Future<List<TaskModel>> loadTasks() async {
    dbLocal.openDB();
    List<TaskModel> listTasks = [];

    dbLocal.getTasks();

    return listTasks;
  }

  @override
  Future<void> updateStatusTask({required TaskModel task}) async {
    //todo
  }
}
