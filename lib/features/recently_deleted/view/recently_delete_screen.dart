import 'package:flutter/material.dart';
import 'package:todo_local_database/features/recently_deleted/view/widgets/recently_deleted_todo_list_view_builder.dart';
import 'package:todo_local_database/features/recently_deleted/view_model/recently_deleted_view_model.dart';
import 'package:provider/provider.dart';

class RecentlyDeleteScreen extends StatefulWidget {
  const RecentlyDeleteScreen({super.key});

  @override
  State<RecentlyDeleteScreen> createState() => _RecentlyDeleteScreenState();
}

class _RecentlyDeleteScreenState extends State<RecentlyDeleteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(context.read<RecentlyDeletedViewModel>().fetch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recently Deleted')),
      body: RecentlyDeletedTodoListViewBuilder(),
    );
  }
}
