import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_local_database/features/todo/view/todo_screen_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TodoScreenProvider(),
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: GoogleFonts.roboto().fontFamily));
  }
}
