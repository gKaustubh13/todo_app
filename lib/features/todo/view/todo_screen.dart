import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/recently_deleted/view/recently_delete_screen_provider.dart';
import 'package:todo_local_database/features/todo/utils/todo_strings.dart';
import 'package:todo_local_database/features/todo/view/create_todo_screen.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_list_view_builder.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_priority_filter_builder.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_sort_drop_down_button.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (context.mounted) context.read<TodoViewModel>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TodoStrings.todosAppBarTitle),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Recently Deleted'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RecentlyDeleteScreenProvider(),
                      ),
                    );
                  },
                ),
              ];
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Search by title"),
                    onChanged: (query) {
                      context.read<TodoViewModel>().onSearchQueryChangedEvent(
                            query,
                          );
                    },
                  ),
                ),
                TodoSortDropDownButton(),
              ],
            ),
          ),
          TodoPriorityFilterBuilder(),
          SizedBox(height: 8),
          Expanded(child: TodoListViewBuilder()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                value: context.read<TodoViewModel>(),
                child: CreateTodoScreen(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
