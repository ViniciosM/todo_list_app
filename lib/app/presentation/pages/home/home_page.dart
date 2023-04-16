import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_colors.dart';
import 'package:todo_list_app/app/core/ui/consts/todo_sizes.dart';
import 'package:todo_list_app/app/core/ui/widgets/todo_label.dart';
import 'package:todo_list_app/app/presentation/pages/home/components/todo_status_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checked = false;

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
            CheckboxListTile(
              title: const TodoLabel(
                text: 'Create home side with profile',
                fontSize: 16,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checked,
              onChanged: (value) {
                setState(() {
                  checked != value;
                });
              },
            ),
            CheckboxListTile(
              dense: true,
              title: const TodoLabel(
                text: 'Create state management to new task',
                fontSize: 16,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              onChanged: (value) {
                setState(() {
                  checked != value;
                });
              },
            ),
            CheckboxListTile(
              title: const TodoLabel(
                text: 'Implements local storage Sqflite',
                fontSize: 16,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checked,
              onChanged: (value) {
                setState(() {
                  checked != value;
                });
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
