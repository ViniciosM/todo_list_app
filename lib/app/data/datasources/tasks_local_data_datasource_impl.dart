import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/app/data/datasources/tasks_local_data_datasource.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';

class TasksLocalDataDatasourceImpl implements TasksLocalDataDatasource {
  @override
  Future<void> createTask({required TaskModel task}) async {
    var prefs = await SharedPreferences.getInstance();
    int counter = await _incrementCount();
    prefs.setString(
        'todo_list',
        jsonEncode({
          'id': counter,
          'title': task.title,
          'status': task.status,
        }));
  }

  @override
  Future<void> deleteTask({required String idTask}) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('todo_list');
  }

  @override
  Future<List<TaskModel>> loadTasks() async {
    var prefs = await SharedPreferences.getInstance();
    String? todoList = prefs.getString('todo_list');
    List<TaskModel> listTasks = [];
    if (todoList != null) {
      List tasks = jsonDecode(todoList);

      for (var t in tasks) {
        listTasks.add(t);
      }
    }
    return listTasks;
  }

  @override
  Future<void> updateStatusTask({required TaskModel task}) async {
    var prefs = await SharedPreferences.getInstance();
  }

  Future<int> _incrementCount() async {
    var prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter')) ?? 0 + 1;
    await prefs.setInt('counter', counter);
    return counter;
  }
}
