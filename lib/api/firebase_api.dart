class FirebaseApi {
  static Future<String> createTodo(Todo todo) async {
    final docTodo = FireBaseFirestore.instance.collection('todo').doc();

    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());

    return docTodo.id;
  }
}
