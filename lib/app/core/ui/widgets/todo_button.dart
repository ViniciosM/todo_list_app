import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/ui/widgets/todo_label.dart';

import '../consts/todo_colors.dart';

class TodoButton extends StatelessWidget {
  const TodoButton(
      {required this.onPressed,
      required this.label,
      this.labelColor = TodoColors.white,
      super.key});

  final VoidCallback onPressed;
  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: TodoLabel(
          color: labelColor,
          text: label,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
