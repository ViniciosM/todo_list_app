import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/theme/consts/todo_colors.dart';
import 'package:todo_list_app/app/data/models/task_model.dart';
import 'package:todo_list_app/app/domain/entities/task_status.dart';
import '../../../../core/theme/widgets/todo_label.dart';

class CheckboxTile extends StatelessWidget {
  const CheckboxTile({required this.taskModel, Key? key}) : super(key: key);

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        //(TODO): Open dialog to remove
      },
      onTap: () {
        //(TODO): Done or undone task
      },
      child: taskModel.status == TaskStatus.done
          ? CheckboxListTile(
              title: TodoLabel(
                text: taskModel.title,
                fontSize: 16,
                color: TodoColors.greyColor,
                textDecoration: TextDecoration.lineThrough,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              onChanged: (value) {},
            )
          : CheckboxListTile(
              title: TodoLabel(
                text: taskModel.title,
                fontSize: 16,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: false,
              onChanged: (value) {},
            ),
    );
  }
}
