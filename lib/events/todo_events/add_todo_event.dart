import 'package:todo_app/bases/base_event.dart';

class AddTodoEvent extends BaseEvent {
  final String _content;
  AddTodoEvent(this._content);
  get content => _content;
}
