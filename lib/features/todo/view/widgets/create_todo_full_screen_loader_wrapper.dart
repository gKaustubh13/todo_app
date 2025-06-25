import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/view/widgets/full_screen_loader_widget.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

class CreateTodoFullScreenLoaderWrapper extends StatelessWidget {
  const CreateTodoFullScreenLoaderWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Selector<TodoViewModel, bool>(
      selector: (context, viewModel) => viewModel.isLoading,
      builder: (context, isLoading, _){
        return Stack(
          children: [
            child,
            if(isLoading) Positioned.fill(child: FullScreenLoaderWidget(),)
          ]
        );
      }
    );
  }
}