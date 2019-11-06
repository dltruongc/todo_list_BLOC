import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/views/todo/todo_container.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List App'),
      ),
      body: Provider.value(
        value: TodoBloc(),
        child: TodoContainer(),
      ),
    );
  }
}
