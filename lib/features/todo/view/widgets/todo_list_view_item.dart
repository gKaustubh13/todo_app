import 'package:flutter/material.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';

class TodoListViewItem extends StatelessWidget {
  const TodoListViewItem({super.key, required this.todo, this.onTap});

  final TodoModel todo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(todo.title, style: Theme.of(context).textTheme.titleLarge),
      subtitle: todo.description != null ? Text(todo.description!) : null,
    );
  }
}
