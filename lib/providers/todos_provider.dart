import 'package:FluDo/api/firebase_api.dart';
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

  List<Todo> get todosCompleted => _todos.where((todo) => todo.isDone).toList();

  void addTodo(Todo todo) {
    FirebaseApi.createTodo(todo);
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners(); //We need to update this todo in the provider class (even though its available locally)
    //so that the listeners will redraw themsevles when the todo gets done.
    //In our case this happens inside the todo_list_widget line 10 will redraw the entire list widget.

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
