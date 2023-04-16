// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:todo_list_app/app/core/database/local/database.dart';

// class DatabaseImpl implements Database {
//   Isar? _databaseInstance;

//   @override
//   Future<Isar> openConnection() async {
//     if (_databaseInstance == null) {
//       final dir = await getApplicationDocumentsDirectory();
//       _databaseInstance = await Isar.open(
//           schemas: [TaskEntitySchema], directory: dir.path, inspector: true);
//     }

//     return _databaseInstance!;
//   }
// }
