import 'package:equatable/equatable.dart';

class TodoSort extends Equatable {
  const TodoSort(
      {required this.name, required this.key, required this.ordering});
  final String name;
  final String key;
  final String ordering;

  static const TodoSort defaultOption =     TodoSort(name: 'Create date Z-A', key: 'createdAt', ordering: 'DESC');



  static const List<TodoSort> options = [
    TodoSort(
      name: 'Create date A-Z',
      key: 'createdAt',
      ordering: 'ASC',
    ),
    TodoSort(name: 'Create date Z-A', key: 'createdAt', ordering: 'DESC'),
    TodoSort(name: 'Last updated A-Z', key: 'updatedAt', ordering: 'ASC'),
    TodoSort(name: 'Last updated Z-A', key: 'updatedAt', ordering: 'DESC'),
  ];
  
  @override
  List<Object?> get props => [key, ordering, name];
}
