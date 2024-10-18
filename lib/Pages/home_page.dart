import 'package:flutter/material.dart';
import 'package:todo/Widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List toDoList = [
    ['learn flutter', false],
    ['eat lunch', false]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index][0],
            );
          }),
    );
  }
}
