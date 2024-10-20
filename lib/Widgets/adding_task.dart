import 'package:flutter/material.dart';

class AddingTask extends StatefulWidget {
  const AddingTask(
      {super.key, required this.controller, required this.newTask});

  final TextEditingController controller;
  final Function() newTask;
  @override
  State<AddingTask> createState() => _AddingTaskState();
}

class _AddingTaskState extends State<AddingTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: 'Add new todo task..',
                  filled: true,
                  fillColor: const Color(0xFFD4BDAC),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: widget.newTask,
            backgroundColor: const Color(0xFFD4BDAC),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
