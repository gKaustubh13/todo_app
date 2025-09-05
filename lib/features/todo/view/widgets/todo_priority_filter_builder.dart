import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/model/todo_priority.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class TodoPriorityFilterBuilder extends StatelessWidget {
  const TodoPriorityFilterBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, TodoPriority?>(
      selector: (context, viewModel) => viewModel.filterPriority,
      builder: (context, selectedPriority, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: TodoPriority.values
                .map(
                  (priority) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(priority.name),
                      onSelected: (value) {
                        context
                            .read<TodoViewModel>()
                            .onFilterPriorityChangedEvent(priority);
                      },
                      selected: priority == selectedPriority,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
    ;
  }
}
