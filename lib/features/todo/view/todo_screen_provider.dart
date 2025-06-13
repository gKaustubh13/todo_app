import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/view/todo_screen.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class TodoScreenProvider extends StatelessWidget {
  const TodoScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: TodoScreen(),
    );
  }
}