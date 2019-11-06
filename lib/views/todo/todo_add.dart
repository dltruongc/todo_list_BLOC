import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/events/todo_events/add_todo_event.dart';

class TodoAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoAddState();
  }
}

class _TodoAddState extends State<TodoAdd> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = Provider.of<TodoBloc>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              hintText: 'Type here',
            ),
          ),
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Add new'),
          onPressed: () {
            bloc.event.add(AddTodoEvent(textController.text));
          },
        ),
      ],
    );
  }
}
