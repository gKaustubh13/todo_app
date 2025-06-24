import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class TodoListViewBuilder extends StatelessWidget {
  const TodoListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, List<TodoModel>>(
      selector: (context, viewModel) => viewModel.todos,
      builder: (context, todos, child) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 0.5),
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              onTap: (){},
              title: Text(
                todo.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: todo.description != null
                  ? Text(
                      todo.description!,
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}
