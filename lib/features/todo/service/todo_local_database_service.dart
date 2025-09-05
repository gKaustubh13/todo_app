import 'package:todo_local_database/core/database/local_database.dart';
import 'package:todo_local_database/features/todo/model/create_todo_model.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';
import 'package:todo_local_database/features/todo/model/todo_priority.dart';
import 'package:todo_local_database/features/todo/model/todo_sort.dart';

class TodoLocalDatabaseService {
  final db = LocalDatabase.instance;

  Future<List<TodoModel>> readAll({
    String? query,
    TodoPriority? priority,
    TodoSort sort = TodoSort.defaultOption,
  }) async {
    final result = await db.rawQuery(
      "SELECT * FROM Todos WHERE deletedAt IS NULL"
      "${query != null && query.trim().isNotEmpty ? " AND title LIKE '%$query%'" : ""}"
      "${priority != null ? " AND priority IS '${priority.name}'" : ""}"
      " ORDER BY ${sort.key} ${sort.ordering}",
    );
    return result.map((map) => TodoModel.fromDatabaseMap(map)).toList();
  }

  Future<List<TodoModel>> search(String query) async {
    final result = await db.rawQuery(
      "SELECT * FROM Todos WHERE deletedAt IS NULL AND title LIKE %$query%",
    );
    return result.map((map) => TodoModel.fromDatabaseMap(map)).toList();
  }

  Future<List<TodoModel>> filter(TodoPriority priority) async {
    final result = await db.rawQuery(
      "SELECT * FROM Todos WHERE deletedAt IS NULL AND priority = ${priority.name}",
    );
    return result.map((map) => TodoModel.fromDatabaseMap(map)).toList();
  }

  sort() async {
    final result = await db.rawQuery(
      "SELECT * FROM Todos WHERE deletedAt IS NULL ORDER BY createdAt ASC",
    );
    return result.map((map) => TodoModel.fromDatabaseMap(map)).toList();
  }

  Future<TodoModel> create(CreateTodoModel model) async {
    final id = await db.insert("Todos", model.toDatabaseMap());
    return TodoModel(
      id: id,
      title: model.title,
      description: model.description,
      completed: model.completed,
      priority: model.priority,
      createdAt: model.createdAt,
      deletedAt: model.deletedAt,
      updatedAt: model.updatedAt,
    );
  }

  Future<void> update(TodoModel updatedModel) async {
    await db.update(
      "Todos",
      updatedModel.toDatabaseUpdateMap(),
      where: "id = ?",
      whereArgs: [updatedModel.id],
    );
  }

  Future<void> delete(TodoModel model) async {
    await db.update("Todos", model.toDatabaseDeleteMap());
  }
}
