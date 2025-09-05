import 'package:flutter/material.dart';
import 'package:todo_local_database/features/recently_deleted/view/view_recently_deleted_todo_screen.dart';
import 'package:todo_local_database/features/recently_deleted/view_model/recently_deleted_view_model.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_list_view_item.dart';
import 'package:provider/provider.dart';

class RecentlyDeletedTodoListView extends StatelessWidget {
  const RecentlyDeletedTodoListView({super.key, required this.todos});

  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 0.5),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoListViewItem(
          todo: todo,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider.value(
                  value: context.read<RecentlyDeletedViewModel>(),
                  child: ViewRecentlyDeletedTodoScreen(todo: todo),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
