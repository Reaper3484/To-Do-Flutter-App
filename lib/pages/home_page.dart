import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stateful/data/database.dart';
import 'package:stateful/util/dialog_box.dart';
import 'package:stateful/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null)
      db.createInitialData();
    else
      db.loadDatabase();
    super.initState();
  }

  void checkBoxChanged(int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    if (_controller.text != '') {
      setState(() {
        db.TodoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.pop(context);

      db.updateDatabase();
    }
  }

  void createNewTask() {
    _controller.clear();
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            saveTask: saveNewTask,
            controller: _controller,
          );
        });
  }

  void deleteTask(index) {
    setState(() {
      db.TodoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 80, 179),

      // App Bar
      appBar: AppBar(
        title: Center(
            child: Text(
          "TO - DO",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        elevation: 3,
        shadowColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 65, 100, 241),
        toolbarHeight: 80,
      ),

      // Floating Action Button to add new tasks
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Color.fromARGB(255, 65, 100, 241),
        splashColor: Color.fromARGB(255, 121, 147, 251),
      ),

      // Main body to hold all the tasks
      body: ListView.builder(
        itemCount: db.TodoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.TodoList[index][0],
            isCompleted: db.TodoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            onSlidePressed: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
