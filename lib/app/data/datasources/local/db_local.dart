// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DBLocal {
//   DBLocal._();

//   static final DBLocal instance = DBLocal._();

//   static Database? _database;

//   get database async {
//     if (_database != null) return _database;

//     return await _initDatabase();
//   }

//   _initDatabase() async {
//     return await openDatabase(
//       join(await getDatabasesPath(), 'todo.db'),
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   _onCreate(db, version) async {
//     await db.execute(_task);
//   }

//   String get _task => '''
//     CREATE TABLE Task (

//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       title TEXT,
//       status TEXT,
//     );
//   ''';
// }

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/task_model.dart';

class DBLocal {
  Database? db;

  Future openDB() async {
    try {
      // Get a location using getDatabasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'todo.db');

      // open the database
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database database, int version) async {
          print(db);
          db = database;
          createTables();
        },
      );
      return true;
    } catch (e) {
      print("ERROR IN OPEN DATABASE $e");
      return Future.error(e);
    }
  }

  createTables() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS task ( "
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title TEXT,"
          "status BOOLEAN,"
          ")";
      await db?.execute(qry);
    } catch (e) {
      print("ERROR IN CREATE TABLE");
      print(e);
    }
  }

  Future saveTask({required TaskModel task}) async {
    await db?.transaction((txn) async {
      var qry =
          'INSERT INTO task(title, status) VALUES("${task.title}",${task.isDone})';
      int id1 = await txn.rawInsert(qry);
      return id1;
    });
  }

  // Future setItemAsFavourite(int id, bool flag) async {
  //   var query = "UPDATE shopping set fav = ? WHERE id = ?";
  //   return await this.db?.rawUpdate(query, [flag ? 1 : 0, id]);
  // }

  Future getTasks() async {
    try {
      var list = await db?.rawQuery('SELECT * FROM task', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future deleteTask(int idTask) async {
    var qry = "DELETE FROM task where id = $idTask";
    return await this.db?.rawDelete(qry);
  }
}
