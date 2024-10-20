import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Widgets/adding_task.dart';
import 'package:todo/Widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  final _myBox = Hive.box("task");

  void checkBoxChanged(int index) {
    setState(() {
      List toDoList = _myBox.get('tasks');
      toDoList[index][1] = !toDoList[index][1];
      _myBox.put("tasks", toDoList);
    });
  }

  void deleteTask(int index) {
    setState(() {
      List toDoList = _myBox.get('tasks');
      toDoList.removeAt(index);
      _myBox.put('tasks', toDoList);
    });
  }

  void newTask() {
    setState(() {
      List toDoList = _myBox.get('tasks');
      if (_controller.text != '') {
        toDoList.add([_controller.text, false]);
        _myBox.put('tasks', toDoList);
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1DB),
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: const Color(0xFF88C273),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: _myBox.get('tasks').length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: _myBox.get('tasks')[index][0],
              completed: _myBox.get('tasks')[index][1],
              onChanged: (value) => checkBoxChanged(index),
              delete: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: AddingTask(
        controller: _controller,
        newTask: newTask,
      ),
    );
  }
}
