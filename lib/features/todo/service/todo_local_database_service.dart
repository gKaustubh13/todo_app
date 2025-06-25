import 'package:todo_local_database/core/database/local_database.dart';
import 'package:todo_local_database/features/todo/model/create_todo_model.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';

class TodoLocalDatabaseService {
  final db = LocalDatabase.instance;

  Future<List<TodoModel>> readAll() async {
    final result =
        await db.rawQuery("SELECT * FROM Todos WHERE deletedAt IS NULL");
    return result
        .map(
          (map) => TodoModel.fromDatabaseMap(map),
        )
        .toList();
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
        updatedAt: model.updatedAt,
        deletedAt: model.deletedAt);
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
    await db.delete("Todos", where: "id = ?", whereArgs: [model.id]);
  }
}
