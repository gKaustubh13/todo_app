import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo_local_database/features/recently_deleted/service/recently_delete_local_database_service.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';

class RecentlyDeletedViewModel extends ChangeNotifier {
  List<TodoModel> _todos = [];
  UnmodifiableListView<TodoModel> get todos => UnmodifiableListView(_todos);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _service = RecentlyDeleteLocalDatabaseService();

  void fetch() async {
    _isLoading = true;
    notifyListeners();
    _todos = await _service.readAll();
    _isLoading = false;
    notifyListeners();
  }

  void delete(TodoModel model) async {
    await _service.delete(model);
    _todos = List.from(_todos..remove(model));
    notifyListeners();
  }

  void onRestoreEvent(TodoModel model) async {
    await _service.restore(model);
    _todos = List.from(_todos..remove(model));
    notifyListeners();
  }
}
