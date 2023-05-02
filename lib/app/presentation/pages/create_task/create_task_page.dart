import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/state/base_state.dart';
import 'package:todo_list_app/app/core/theme/consts/todo_sizes.dart';
import 'package:todo_list_app/app/core/theme/widgets/todo_button.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';
import 'package:todo_list_app/app/domain/entities/task_entity.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import 'package:todo_list_app/app/presentation/pages/create_task/controller/create_task_controller.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/consts/todo_colors.dart';
import '../../../core/theme/widgets/todo_label.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({required this.createTaskController, super.key});

  final CreateTaskController createTaskController;

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
    return BlocListener<CreateTaskController, BaseState>(
      bloc: widget.createTaskController,
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint('Task error!');
        } else if (state is SuccessState) {
          debugPrint('Task created!');
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
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
                    height: TodoSizes.size30,
                  ),
                  TodoButton(
                      onPressed: () async {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          TaskEntity taskEntity = TaskEntity(
                              title: _titleEC.text, status: TaskStatus.pending);

                          await widget.createTaskController.createTask(
                              taskModel: TaskModel.fromEntity(taskEntity));
                        }
                      },
                      label: 'Create task'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
