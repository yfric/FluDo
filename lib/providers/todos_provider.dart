import 'package:FluDo/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog 🐕",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog 🐕",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog 🐕",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog 🐕",
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => !todo.isDone).toList();
}
