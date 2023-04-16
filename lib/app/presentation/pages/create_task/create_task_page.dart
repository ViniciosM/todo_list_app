import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_sizes.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';
import 'package:todo_list_app/app/domain/entities/task_status_entity.dart';
import 'package:todo_list_app/app/presentation/pages/create_task/controller/create_task_controller.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../core/ui/consts/todo_colors.dart';
import '../../../core/ui/widgets/todo_button.dart';
import '../../../core/ui/widgets/todo_label.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  late TextEditingController _titleEC;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleEC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTaskController, CreateTaskStatus>(
      bloc: sl<CreateTaskController>(),
      listener: (context, state) {
        switch (state) {
          case CreateTaskStatus.success:
            debugPrint('Task created!');
            Navigator.pop(context);
            break;
          case CreateTaskStatus.failure:
            debugPrint('Failed to save task!');
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TodoLabel(
            text: 'New task',
            color: TodoColors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TodoSizes.padding20),
          child: SingleChildScrollView(
            reverse: true,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: TodoSizes.size30,
                  ),
                  TextFormField(
                    controller: _titleEC,
                    decoration: const InputDecoration(
                      label: TodoLabel(text: 'Title'),
                    ),
                    validator: Validatorless.required('Title is required.'),
                  ),
                  const SizedBox(
                    height: TodoSizes.size40,
                  ),
                  TodoButton(
                    label: 'Save task',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        TaskModel task =
                            TaskModel(title: _titleEC.text, isDone: false);
                        sl<CreateTaskController>().createTask(taskModel: task);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
