import 'package:todo_local_database/features/todo/model/todo_priority.dart';

class TodoModel {
  TodoModel(
      {required this.id,
      required this.title,
      this.description,
      required this.completed,
      required this.priority,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});

  final int id;
  final String title;
  final String? description;
  final bool completed;
  final TodoPriority priority;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  factory TodoModel.fromDatabaseMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map["id"] as int,
      title: map["title"] as String,
      description: map["description"] as String?,
      completed: (map["completed"] as int) == 1,
      priority: todoPriorityfromName(map["priority"] as String),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map["createdAt"] as int),
      updatedAt: map["updatedAt"] != null
          ? DateTime.fromMillisecondsSinceEpoch(map["updatedAt"] as int)
          : null,
      deletedAt: map["deletedAt"] != null
          ? DateTime.fromMillisecondsSinceEpoch(map["deletedAt"] as int)
          : null,
    );
  }

  Map<String, dynamic> toDatabaseMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "completed": completed ? 1 : 0,
      "priority": priority.name,
      "createdAt": createdAt.millisecondsSinceEpoch,
      "updatedAt": updatedAt?.millisecondsSinceEpoch,
      "deletedAt": deletedAt?.microsecondsSinceEpoch,
    };
  }

  Map<String, dynamic> toDatabaseUpdateMap() {
    return {
      "title": title,
      "description": description,
      "completed": completed ? 1 : 0,
      "priority": priority.name,
      "updatedAt": DateTime.now().millisecondsSinceEpoch,
    };
  }

  Map<String, dynamic> toDatabaseDeleteMap() {
    return {
      "deletedAt": DateTime.now().millisecondsSinceEpoch,
    };
  }
}
