import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/view/view_todo_screen.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class TodoListViewItem extends StatelessWidget {
  const TodoListViewItem({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                value: context.read<TodoViewModel>(),
                child: ViewTodoScreen(todo: todo))));
      },
      title: Text(todo.title, style: Theme.of(context).textTheme.titleLarge),
      subtitle: todo.description != null ? Text(todo.description!) : null,
    );
  }
}
