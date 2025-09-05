import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_local_database/features/todo/model/create_todo_model.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/model/todo_priority.dart';
import 'package:todo_local_database/features/todo/model/todo_sort.dart';
import 'package:todo_local_database/features/todo/service/todo_local_database_service.dart';
class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todos = [];
  UnmodifiableListView<TodoModel> get todos => UnmodifiableListView(_todos);

  final _service = TodoLocalDatabaseService();

  TodoPriority _selectedPriority = TodoPriority.low;
  TodoPriority get selectedPriority => _selectedPriority;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _query;

  TodoPriority? _filterPriority;
  TodoPriority? get filterPriority => _filterPriority;

  TodoSort get sort => _sort;
  TodoSort _sort = TodoSort.defaultOption;

  void fetch() async {
    _todos = await _service.readAll(
      query: _query,
      priority: _filterPriority,
      sort: _sort,
    );
    notifyListeners();
  }

  void onSearchQueryChangedEvent(String query) async {
    _query = query;
    fetch();
  }

  void onFilterPriorityChangedEvent(TodoPriority priority) {
    if (_filterPriority == priority) {
      _filterPriority = null;
      notifyListeners();
    } else {
      _filterPriority = priority;
    }
    fetch();
  }

  void onSortChangedEvent(TodoSort sort) {
    _sort = sort;
    fetch();
  }

  Future<void> create({
    required String title,
    required String description,
  }) async {
    _isLoading = true;
    notifyListeners();
    final model = CreateTodoModel(
      title: title.trim(),
      description: description.trim().isEmpty ? null : description,
      completed: false,
      priority: _selectedPriority,
      createdAt: DateTime.now(),
    );
    final createdTodo = await _service.create(model);
    _todos = [..._todos, createdTodo];
    _isLoading = false;
    notifyListeners();
    print("Todo created!");
  }

  void onPriorityChangedEvent(TodoPriority priority) {
    _selectedPriority = priority;
    notifyListeners();
  }

  Future<void> update({
    required TodoModel todo,
    required String title,
    required String description,
  }) async {
    int index = _todos.indexOf(todo);
    _isLoading = true;
    notifyListeners();
    final updatedModel = todo.copyWith(
      title: title,
      description: description,
      priority: _selectedPriority,
      updatedAt: DateTime.now(),
    );
    await _service.update(updatedModel);
    _isLoading = false;

    List<TodoModel> updatedTodos = List.from(_todos);
    updatedTodos[index] = updatedModel;
    _todos = updatedTodos;
    notifyListeners();

    print("Todo updated!");
  }

  Future<void> delete({required TodoModel todo}) async {
    int index = _todos.indexOf(todo);
    await _service.delete(todo);

    List<TodoModel> updatedTodos = List.from(_todos);
    updatedTodos.removeAt(index);
    _todos = updatedTodos;
    notifyListeners();
  }
}
