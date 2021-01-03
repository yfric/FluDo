import 'package:FluDo/models/todo_model.dart';
import 'package:FluDo/providers/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: buildTodo(context),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () {},
            caption: "Edit",
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            caption: "Delete",
            onTap: () {
              deleteTodo(context, todo);
            },
            icon: Icons.delete,
          )
        ],
      ),
    );
  }

  Widget buildTodo(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_) {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              final isDone = provider.toggleTodoStatus(todo);

              Utils.showSnackBar(
                context,
                isDone ? 'Task completed' : 'Task marked incomplete',
              );
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22),
              ),
              if (todo.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    todo.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ))
        ],
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, "Deleted the task");
  }
}
