import 'package:FluDo/widgets/todo_form_widget.dart';
import 'package:flutter/material.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Todo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (desciption) =>
                setState(() => this.description = description),
            onSavedTodo: () {},
          )
        ],
      ),
    );
  }
}
