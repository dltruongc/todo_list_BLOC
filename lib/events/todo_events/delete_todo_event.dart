import 'package:todo_app/bases/base_event.dart';
import 'package:todo_app/models/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  final Todo _content;
  DeleteTodoEvent(this._content);
  get todo => _content;
}
