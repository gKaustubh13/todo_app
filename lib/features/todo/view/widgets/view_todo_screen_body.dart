import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
class ViewTodoScreenBody extends StatelessWidget {
  const ViewTodoScreenBody({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.title, style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: 8),
            Text(
              DateFormat("EEEE, d MMMM yyyy").format(todo.createdAt),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            if (todo.description != null)
              Text(
                todo.description!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
          ],
        ),
      ),
    );
  }
}
