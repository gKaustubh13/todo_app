import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/model/todo_priority.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class TodoPriorityOptionBuilder extends StatelessWidget {
  const TodoPriorityOptionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, TodoPriority>(
      selector: (context, viewModel) => viewModel.selectedPriority,
      builder: (context, selectedPriority, child) {
      return Row(
        children: TodoPriority.values
            .map((priority) => Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ChoiceChip(
                    label: Text(priority.name),
                    onSelected: (value) {
                      if(value){
                        context.read<TodoViewModel>().onPriorityChangedEvent(priority);
                      }
                    },
                    selected: priority == selectedPriority,
                  ),
                ))
            .toList(),
      );
      } ,
    );
  }
}
