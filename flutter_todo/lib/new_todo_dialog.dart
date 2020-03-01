import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';

class NewTodoDialog extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New todo'),
      content: TextField(
        controller: controller,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
            controller.clear();
          },
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            final todo = Todo(title: controller.value.text);
            controller.clear();
            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }
}
