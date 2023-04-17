import 'package:flutter/material.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';

import '../../../../core/ui/widgets/todo_label.dart';

class CheckboxTile extends StatelessWidget {
  const CheckboxTile({required this.taskModel, Key? key}) : super(key: key);

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: TodoLabel(
        text: taskModel.title,
        fontSize: 16,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: taskModel.status == TaskStatus.pending ? false : true,
      onChanged: (value) {},
    );
  }
}
