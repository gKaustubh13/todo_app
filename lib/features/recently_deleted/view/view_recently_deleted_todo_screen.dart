import 'package:flutter/material.dart';
import 'package:todo_local_database/features/recently_deleted/view_model/recently_deleted_view_model.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/view/dialogs/todo_dialog_helper.dart';
import 'package:todo_local_database/features/todo/view/widgets/view_todo_screen_body.dart';
import 'package:provider/provider.dart';

class ViewRecentlyDeletedTodoScreen extends StatelessWidget {
  const ViewRecentlyDeletedTodoScreen({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Deleted Todo'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Restore"),
                  onTap: () {
                    context.read<RecentlyDeletedViewModel>().onRestoreEvent(
                          todo,
                        );
                    Navigator.of(context).pop();
                  },
                ),
                PopupMenuItem(
                  child: Text("Delete"),
                  onTap: () {
                    TodoDialogHelper.instance
                        .showPermanantlyDeleteConfirmationDialog(
                      context: context,
                      todo: todo,
                    );
                  },
                ),
              ];
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ViewTodoScreenBody(todo: todo),
    );
  }
}
