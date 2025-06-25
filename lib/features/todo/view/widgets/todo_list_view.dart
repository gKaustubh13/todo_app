import 'package:flutter/material.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_list_view_item.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key, required this.todos});

  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 0.5),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoListViewItem(todo: todo);
      },
    );
  }
}
