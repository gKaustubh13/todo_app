import 'package:flutter/material.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier{
  List<TodoModel> todos = [];

  final service = TodoLocalDatabaseService();
  void fetch()async {
    todos = await service.readAll();
    notifyListeners();
  }

  void create(){}
}