import 'package:get_it/get_it.dart';
import 'package:todo_list_app/app/core/database/local/database.dart';
import 'package:todo_list_app/app/core/database/local/database_impl.dart';
import 'package:todo_list_app/app/data/datasources/task/tasks_local_datasource.dart';
import 'package:todo_list_app/app/data/datasources/task/tasks_local_datasource_impl.dart';
import 'package:todo_list_app/app/data/repositories/task_repository_impl.dart';
import 'package:todo_list_app/app/domain/repositories/task_repository.dart';
import 'package:todo_list_app/app/domain/usecases/task/create_task_usecase.dart';
import 'package:todo_list_app/app/domain/usecases/task/delete_task_usecase.dart';
import 'package:todo_list_app/app/domain/usecases/task/load_tasks_usecase.dart';
import 'package:todo_list_app/app/domain/usecases/task/update_status_task_usecase.dart';
import 'package:todo_list_app/app/presentation/pages/create_task/controller/create_task_controller.dart';
import 'package:todo_list_app/app/presentation/pages/home/controller/home_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => CreateTaskController(
      createTaskUsecase: sl(),
    ),
  );
  sl.registerFactory(() =>
      HomeController(loadTasksUsecase: sl(), updateStatusTaskUsecase: sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateTaskUsecase(taskRepository: sl()));
  sl.registerLazySingleton(() => DeleteTaskUsecase(taskRepository: sl()));
  sl.registerLazySingleton(() => LoadTasksUsecase(taskRepository: sl()));
  sl.registerLazySingleton(() => UpdateStatusTaskUsecase(taskRepository: sl()));

  // Repositories
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(tasksLocalDatasource: sl()),
  );
  //! Data sources
  sl.registerLazySingleton<TasksLocalDatasource>(
      () => TasksLocalDatasourceImpl(database: sl()));

  // Local DB
  sl.registerLazySingleton<Database>(() => DatabaseImpl());
}
