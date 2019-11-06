import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/events/todo_events/delete_todo_event.dart';
import 'package:todo_app/models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoBloc>(builder: (context, bloc, snapshot) {
        return StreamBuilder <List<Todo>>(
            stream: bloc.stream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].content),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.blue[300],
                            ),
                            onPressed: () {
                              bloc.event.add(DeleteTodoEvent(snapshot.data[index]));
                            },
                          ),
                        );
                      });
                case ConnectionState.none:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.waiting:
                default:
                  return Center(child: Text('Empty'));
              }
            });
      }),
    );
  }
}
