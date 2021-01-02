import 'package:FluDo/models/todo_model.dart';
import 'package:FluDo/providers/todos_provider.dart';
import 'package:FluDo/widgets/todo_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No Todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 8,
              );
            },
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
