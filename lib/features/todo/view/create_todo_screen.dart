import 'package:flutter/material.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_list_view_builder.dart';

class CreateTodoScreen extends StatelessWidget {
  const CreateTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Todo")),
      body: Container(),

    );
  }
}