import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_colors.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_sizes.dart';
import 'package:todo_list_app/app/core/ui/widgets/todo_label.dart';
import 'package:todo_list_app/app/presentation/pages/home/components/todo_status_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = true;

    return Scaffold(
      backgroundColor: TodoColors.backgroundColor,
      appBar: AppBar(
        title: const TodoLabel(
          text: 'To do list',
          color: TodoColors.white,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: TodoColors.primaryColor,
        elevation: 0,
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
            ListTile(
              leading: Checkbox(
                onChanged: (value) {
                  check != value;
                },
                value: check,
              ),
              title: const Text('Title task here'),
            )
          ],
        ),
      ),
      floatingActionButton: IconButton(
        highlightColor: TodoColors.primaryColor,
        icon: const Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }
}
