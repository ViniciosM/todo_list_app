import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_colors.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_sizes.dart';
import 'package:todo_list_app/app/core/ui/widgets/todo_label.dart';
import 'package:todo_list_app/app/presentation/pages/home/components/checkbox_tile.dart';
import 'package:todo_list_app/app/presentation/pages/home/components/todo_status_container.dart';
import 'package:todo_list_app/app/presentation/pages/home/controller/home_controller.dart';

import '../../../../injection_container.dart';
import '../../../data/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: sl<HomeController>(),
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          debugPrint('Failed to load tasks');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TodoLabel(
            text: 'To do list',
            color: TodoColors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: TodoSizes.size40),
              const TodoStatusContainer(),
              const SizedBox(
                height: 20,
              ),
              BlocSelector<HomeController, HomeState, bool>(
                  bloc: sl<HomeController>(),
                  selector: (state) => state.status == HomeStatus.loading,
                  builder: (context, showLoading) {
                    return const SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }),
              BlocSelector<HomeController, HomeState, List<TaskModel>>(
                bloc: sl<HomeController>(),
                selector: (state) => state.tasks,
                builder: (context, tasks) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return CheckboxTile(taskModel: tasks[index]);
                      },
                      separatorBuilder: (context, index) => const Divider());
                },
              )
            ],
          ),
        ),
        floatingActionButton: IconButton(
          highlightColor: TodoColors.primaryColor,
          icon: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/create_task');
          },
        ),
      ),
    );
  }
}
