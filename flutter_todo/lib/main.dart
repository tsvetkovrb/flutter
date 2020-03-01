import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo/todo_list_screen.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world',
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(),
    );
  }
}
