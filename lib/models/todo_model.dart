import '../utils.dart';

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

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };

  static Todo fromJson(Map<String, dynamic> json) {
    print('gets called');
    return Todo(
      createdTime: Utils.toDateTime(json['createdTime']),
      title: json['title'],
      description: json['description'],
      id: json['id'],
      isDone: json['isDone'],
    );
  }
}
