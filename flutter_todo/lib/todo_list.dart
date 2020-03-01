import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';

typedef ToggleCompleteCallBack = void Function(Todo, bool);

class TodoList extends StatelessWidget {
  TodoList({@required this.todos, @required this.onCompleteToggle});

  final List<Todo> todos;

  final ToggleCompleteCallBack onCompleteToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        onCompleteToggle(todo, isChecked);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: _buildItem,
    );
  }
}
