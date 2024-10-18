import 'package:flutter/material.dart';

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
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.deepPurple,
                child: Text(
                  toDoList[index][0],
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          }),
    );
  }
}
