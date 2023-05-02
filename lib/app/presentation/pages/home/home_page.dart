import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/app/core/state/base_state.dart';
import 'package:todo_list_app/app/core/theme/consts/todo_colors.dart';
import 'package:todo_list_app/app/core/theme/consts/todo_sizes.dart';
import 'package:todo_list_app/app/core/theme/widgets/todo_label.dart';
import 'package:todo_list_app/app/presentation/pages/home/components/checkbox_tile.dart';
import 'package:todo_list_app/app/presentation/pages/home/components/todo_status_container.dart';
import 'package:todo_list_app/app/presentation/pages/home/controller/home_controller.dart';

import '../../../data/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.homeController, Key? key}) : super(key: key);

  final HomeController homeController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            BlocBuilder<HomeController, BaseState>(
              bloc: widget.homeController,
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessState) {
                  var tasks = state.data;
                  return ListView.separated(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return CheckboxTile(
                            taskModel: TaskModel.fromEntity(tasks[index]));
                      },
                      separatorBuilder: (context, index) => const Divider());
                } else if (state is ErrorState) {
                  const Center(
                    child: TodoLabel(
                      text: 'Sorry, error when load tasks',
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
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
    );
  }
}
