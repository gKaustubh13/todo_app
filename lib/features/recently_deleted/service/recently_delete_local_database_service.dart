import 'package:todo_local_database/core/database/local_database.dart';
import 'package:todo_local_database/features/todo/model/todo_model.dart';

class RecentlyDeleteLocalDatabaseService {
  final _db = LocalDatabase.instance;

  Future<List<TodoModel>> readAll() async {
    final result = await _db.rawQuery(
      "SELECT * FROM Todos WHERE deletedAt IS NOT NULL",
    );
    return result.map((map) => TodoModel.fromDatabaseMap(map)).toList();
  }

  Future<void> delete(TodoModel model) async {
    await _db.delete("Todos", where: "id = ?", whereArgs: [model.id]);
  }

  Future<void> restore(TodoModel model) async {
    await _db.update(
      "Todos",
      model.toDatabaseRestoreMap(),
      where: "id = ?",
      whereArgs: [model.id],
    );
  }
}
