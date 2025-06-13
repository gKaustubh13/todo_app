import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  const LocalDatabase._();

  static late Database instance;

  static Future<void> init() async {
    final path = await getDatabasesPath();
    final databasePath = "$path/todo_database.db";

    instance = await openDatabase(
      databasePath,
      version: 1, 
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Todos (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL, description TEXT, completed INTEGER NOT NULL, priority TEXT NOT NULL, createdAt INTEGER NOT NULL, updatedAt INTEGER, deletedAt INTEGER)',
        );
        print("Todos table created");
      }
    );
  }
}
