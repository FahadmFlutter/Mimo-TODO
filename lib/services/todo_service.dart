import '../models/todo.dart';

class TodoService {
  final List<Todo> _todos = [];

  List<Todo> getTodosByCategory(String categoryId) {
    return _todos.where((todo) => todo.categoryId == categoryId).toList();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void toggleTodo(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex != -1) {
      _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted;
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
  }
}