import 'package:flutter/material.dart';
import 'package:todo_app/views/todo/todo_add.dart';
import 'package:todo_app/views/todo/todo_list.dart';

class TodoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TodoAdd(),
        TodoList(),
      ],
    );
  }
}
