import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:todo_local_database/features/recently_deleted/view/widgets/recently_deleted_todo_list_view.dart';
import 'package:todo_local_database/features/recently_deleted/view_model/recently_deleted_view_model.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:provider/provider.dart';

class RecentlyDeletedTodoListViewBuilder extends StatelessWidget {
  const RecentlyDeletedTodoListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<RecentlyDeletedViewModel, Tuple2<List<TodoModel>, bool>>(
      selector: (_, viewModel) => Tuple2(viewModel.todos, viewModel.isLoading),
      builder: (context, tuple, child) {
        final todos = tuple.value1;
        final isLoading = tuple.value2;
        if (isLoading) return Center(child: CircularProgressIndicator());
        return RecentlyDeletedTodoListView(todos: todos);
      },
    );
  }
}
