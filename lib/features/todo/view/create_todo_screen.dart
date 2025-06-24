import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_local_database/features/todo/view/widgets/todo_priority_option_builder.dart';
import 'package:todo_local_database/features/todo/view_model/todo_view_model.dart';

final _formKey = GlobalKey<FormState>();

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Todo")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                      controller: titleController,
                      style: Theme.of(context).textTheme.titleMedium,
                      validator: (value) {
                        if (value == null) return "Title is required";
                        if (value.trim().isEmpty == true) return "Title is required";
                        if (value.trim().length <= 2)
                          return "Title shoud have more than 2 characters";
                        return null;
                      },
                      maxLines: 2,
                      maxLength: 75,
                      decoration: InputDecoration(
                          hintText: "Enter Title...",
                          border: InputBorder.none,
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.surfaceContainer)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                      controller: descriptionController,
                      maxLines: 5,
                      maxLength: 300,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                          hintText: "Enter Description...",
                          border: InputBorder.none,
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.surfaceContainer)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Select Priority",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TodoPriorityOptionBuilder(),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                      child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              context.read<TodoViewModel>().create(
                                  title: titleController.text,
                                  description: descriptionController.text).whenComplete((){
                                    if(context.mounted){
                                      Navigator.of(context).pop();
                                    }
                                  });
                            }
                          },
                          child: Text("Create")))
                ],
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }
}
