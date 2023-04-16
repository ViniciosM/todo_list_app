import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_colors.dart';
import 'package:todo_list_app/app/core/ui/widgets/todo_label.dart';

class TodoStatusContainer extends StatelessWidget {
  const TodoStatusContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: TodoColors.neutralColor,
          height: 40,
          width: width * 0.3,
          child: const Align(
            alignment: Alignment.center,
            child: TodoLabel(
              text: 'All',
              color: TodoColors.darkColor,
            ),
          ),
        ),
        Container(
          color: TodoColors.neutralColor,
          height: 40,
          width: width * 0.3,
          child: const Align(
            alignment: Alignment.center,
            child: TodoLabel(
              text: 'pending',
              color: TodoColors.darkColor,
            ),
          ),
        ),
        Container(
          color: TodoColors.neutralColor,
          height: 40,
          width: width * 0.3,
          child: const Align(
            alignment: Alignment.center,
            child: TodoLabel(
              text: 'done',
              color: TodoColors.darkColor,
            ),
          ),
        ),
      ],
    );
  }
}
