import 'package:flutter/material.dart';
import 'package:todo_local_database/features/todo/utils/todo_strings.dart';

class TodoDeleteDialog extends StatelessWidget {
  const TodoDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(TodoStrings.totoDeleteDialogTitle),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel")
        ),
        FilledButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Delete")
        ),
      ],
    );
  }
}
