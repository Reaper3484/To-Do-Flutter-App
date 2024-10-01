import 'package:hive/hive.dart';

class TodoDatabase {
  List TodoList = [];

  final _myBox = Hive.box('myBox');

  void createInitialData() {
    TodoList = [
      ['Do excercise', false],
      ['Do laundry', false]
    ];
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", TodoList);
    print(TodoList);
  }

  void loadDatabase() {
    TodoList = _myBox.get("TODOLIST");
  }
}
