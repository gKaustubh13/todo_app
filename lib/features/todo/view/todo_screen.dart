import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/view/create_todo_screen.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_list_view_builder.dart';
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
      appBar: AppBar(title: Text("Todos")),
      body: TodoListViewBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                  value: context.read<TodoViewModel>(),
                  child: CreateTodoScreen())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
