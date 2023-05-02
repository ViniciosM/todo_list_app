import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/app/core/theme/widgets/todo_label.dart';

import '../consts/todo_colors.dart';

class TodoButtonWithLoader<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;
  final String label;
  final Color labelColor;

  const TodoButtonWithLoader(
      {super.key,
      required this.selector,
      required this.bloc,
      required this.onPressed,
      this.labelColor = TodoColors.white,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: BlocSelector<B, S, bool>(
          bloc: bloc,
          selector: selector,
          builder: (context, showLoading) {
            if (!showLoading) {
              return TodoLabel(
                text: label,
                color: labelColor,
              );
            }
            return Stack(alignment: Alignment.center, children: const [
              CircularProgressIndicator.adaptive(
                strokeWidth: 3,
                backgroundColor: Colors.white,
              )
            ]);
          },
        ));
  }
}
