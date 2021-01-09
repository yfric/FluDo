import 'package:FluDo/api/firebase_api.dart';
import 'package:FluDo/main.dart';
import 'package:FluDo/models/todo_model.dart';
import 'package:FluDo/providers/todos_provider.dart';
import 'package:FluDo/widgets/add_todo_dialog.dart';
import 'package:FluDo/widgets/completed_list_widget.dart';
import 'package:FluDo/widgets/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            title: Text('Todo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            title: Text('Completed'),
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
          //WHY DOES THIS NEED TO LIVE HERE - WHY COULD YOU NOT JUST LISTEN TO A STREAM IN THE PROVIDER AND NOTIFY LISTENERS - ASK ON YOU TUBE
          stream: FirebaseApi.readTodos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Text('Something Went Wrong Try later');
                } else {
                  final todos = snapshot.data;
                  final provider = Provider.of<TodosProvider>(context);
                  provider.setTodos(todos);

                  return tabs[selectedIndex];
                }
            }
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          child: AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
