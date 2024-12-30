import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../provider/category_provider.dart';
import '../provider/todo_provider.dart';
import '../widgets/task_input.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  final String categoryId;

  const TasksScreen({
    super.key,
    required this.categoryId,
  });

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTodo() {
    if (_controller.text.isEmpty) return;

    final todo = Todo(
      id: DateTime.now().toString(),
      title: _controller.text,
      categoryId: widget.categoryId,
    );

    Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
    _controller.clear();
    Navigator.pop(context);
  }
  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TaskInput(
          controller: _controller,
          onSubmit: _addTodo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryProvider>(context).getCategoryById(widget.categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.title ?? 'Tasks'),
      ),
      body: Column(
        children: [
          // TaskInput(
          //   controller: _controller,
          //   onSubmit: _addTodo,
          // ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                final todos = todoProvider.getTodosByCategory(widget.categoryId);
                return TaskList(
                  todos: todos,
                  onToggle: todoProvider.toggleTodo,
                  onDelete: todoProvider.deleteTodo,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCategoryDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}