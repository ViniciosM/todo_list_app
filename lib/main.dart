import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/theme/app_config_ui.dart';
import 'package:todo_list_app/app/presentation/pages/create_task/controller/create_task_controller.dart';
import 'package:todo_list_app/app/presentation/pages/create_task/create_task_page.dart';
import 'package:todo_list_app/app/presentation/pages/home/controller/home_controller.dart';
import 'package:todo_list_app/injection_container.dart';
import 'app/presentation/pages/home/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: AppConfigUI.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              homeController: sl<HomeController>()..loadTasks(),
            ),
        '/create_task': (context) => CreateTaskPage(
              createTaskController: sl<CreateTaskController>(),
            ),
      },
    );
  }
}
