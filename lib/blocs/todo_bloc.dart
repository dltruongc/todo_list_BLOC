import 'dart:async';
import 'dart:math';

import 'package:todo_app/bases/base_bloc.dart';
import 'package:todo_app/bases/base_event.dart';
import 'package:todo_app/events/todo_events/add_todo_event.dart';
import 'package:todo_app/events/todo_events/delete_todo_event.dart';
import 'package:todo_app/models/todo.dart';

class TodoBloc extends BaseBloc {
  StreamController<List<Todo>> _eventController = StreamController<List<Todo>>();

  List<Todo> _todoListData = List<Todo>();

  Stream <List<Todo>> get stream => _eventController.stream;
  Random _int = Random();

  _addTodo(Todo todo) {
    _todoListData.add(todo);
    _eventController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) {
    _todoListData.remove(todo);
    _eventController.sink.add(_todoListData);
  }

  @override
  void dispatch(BaseEvent event) {
    if (event is AddTodoEvent) {
      Todo todo = Todo(_int.nextInt(10000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _eventController.close();
    print('dispose');
  }
}
