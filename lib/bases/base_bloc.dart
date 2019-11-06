import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/bases/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _blocController = StreamController<BaseEvent>();
  Sink<BaseEvent> get event => _blocController.sink;

  BaseBloc() {
    _blocController.stream.listen(
      (event) {
        if (event is! BaseEvent) {
          throw Exception ('Invalid event.');
        }

        dispatch(event);
      }
    );
  }

  void dispatch (BaseEvent event);

  @mustCallSuper
  void dispose() {
_blocController.close();
  }
}