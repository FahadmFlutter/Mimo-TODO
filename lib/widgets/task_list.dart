import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'todo_item.dart';

class TaskList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const TaskList({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onToggle: () => onToggle(todo.id),
          onDelete: () => onDelete(todo.id),
        );
      },
    );
  }
}