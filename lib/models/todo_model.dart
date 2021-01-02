class TodoField {
  static const createdTime = 'createTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    this.createdTime,
    this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}
