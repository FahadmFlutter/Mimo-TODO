import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const TaskInput({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Add a new task',
          border: InputBorder.none,
        ),
        onSubmitted: (_) => onSubmit(),

      ),
    );
  }
}