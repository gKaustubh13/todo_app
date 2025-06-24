import 'package:flutter/material.dart';
import 'package:todo_local_database/features/todo/model/create_todo_model.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/model/todo_priority.dart';
import 'package:todo_local_database/features/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> todos = [];

  final _service = TodoLocalDatabaseService();

  TodoPriority selectedPriority = TodoPriority.low;

  void fetch() async {
    todos = await _service.readAll();
    notifyListeners();
  }

  Future<void> create({required String title, required String description}) async {
    final model = CreateTodoModel(
        title: title.trim(),
        description: description.trim().isEmpty ? null : description,
        completed: false,
        priority: selectedPriority,
        createdAt: DateTime.now());
    final createdTodo = await _service.create(model);
    todos = [...todos, createdTodo];
    notifyListeners();
    print("Todo created");
  }

  void onPriorityChangedEvent(TodoPriority priority) {
    selectedPriority = priority;
    notifyListeners();
  }
}
