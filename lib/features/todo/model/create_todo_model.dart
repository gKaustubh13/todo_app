import 'package:todo_local_database/features/todo/model/todo_priority.dart';

class CreateTodoModel {
  const CreateTodoModel({
      required this.title,
      this.description,
      required this.completed,
      required this.priority,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt
  });

  final String title;
  final String? description;
  final bool completed;
  final TodoPriority priority;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

    Map<String, dynamic> toDatabaseMap(){
    return{
      "title": title,
      "description": description,
      "completed": completed ? 1 : 0,
      "priority": priority.name,
      "createdAt": createdAt.millisecondsSinceEpoch,
      "updatedAt": updatedAt?.millisecondsSinceEpoch,
      "deletedAt": deletedAt?.millisecondsSinceEpoch,
    };
  }

}
