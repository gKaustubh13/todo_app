import 'package:flutter/material.dart';
import 'package:todo_local_database/application.dart';
import 'package:todo_local_database/core/database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.init();
  
  runApp(const Application());
}