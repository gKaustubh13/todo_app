import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/view/create_todo_screen.dart';
import 'package:todo_local_database/features/todo/view/dialogs/todo_dialog_helper.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class ViewTodoScreen extends StatelessWidget {
  const ViewTodoScreen({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Todo"),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: Text("Edit"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider.value(
                            value: context.read<TodoViewModel>(),
                            child: CreateTodoScreen(todo: todo))));
                  })
            ];
          }),
          PopupMenuItem(
            child: Text("Delete"),
            onTap: () {
              TodoDialogHelper.instance.showDeleteConfirmationDialog(
                context: context,
                todo: todo,
              );
            },
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                Text(todo.title,
                    style: Theme.of(context).textTheme.displaySmall),
                SizedBox(
                  height: 8,
                ),
                Text(
                  DateFormat("EEEE, d MMMM yyyy").format(todo.createdAt),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 16,
                ),
                if (todo.description != null)
                  Text(todo.description!,
                      style: Theme.of(context).textTheme.bodyLarge)
              ],
            )),
      ),
    );
  }
}
