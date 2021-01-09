import 'package:FluDo/models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils.dart';

class FirebaseApi {
  static Future<String> createTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc();

    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());

    return docTodo.id;
  }

  static Stream<List<Todo>> readTodos() => FirebaseFirestore.instance
      .collection('todo')
      .snapshots()
      .transform(Utils.transformer(Todo.fromJson));
}
