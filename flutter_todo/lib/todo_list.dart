import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';

typedef ToggleCompleteCallBack = void Function(Todo, bool);
typedef RemoveTodoCallBack = void Function(int);

class TodoList extends StatelessWidget {
  TodoList(
      {@required this.todos,
      @required this.onCompleteToggle,
      @required this.onRemoveTodo});

  final List<Todo> todos;

  final ToggleCompleteCallBack onCompleteToggle;
  final RemoveTodoCallBack onRemoveTodo;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    final title = todo.title;

    return Dismissible(
      key: Key(todo.title),
      onDismissed: (direction) {
        onRemoveTodo(index);

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("$title was deleted!"),
        ));
      },
      background: Container(
        color: Colors.red,
      ),
      child: CheckboxListTile(
        value: todo.isDone,
        title: Text(todo.title),
        onChanged: (bool isChecked) {
          onCompleteToggle(todo, isChecked);
        },
      ),
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
