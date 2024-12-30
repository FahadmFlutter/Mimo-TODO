import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/todo.dart';
import '../services/storage_service.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  List<Todo> getTodosByCategory(String categoryId) {
    return _todos.where((todo) => todo.categoryId == categoryId).toList();
  }

  Future<void> loadTodos() async {
    final todosJson = await StorageService.getString('todos');
    if (todosJson != null) {
      final List<dynamic> decoded = json.decode(todosJson);
      _todos = decoded.map((item) => Todo.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
    await _saveTodos();
    notifyListeners();
  }

  Future<void> toggleTodo(String id) async {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex != -1) {
      _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted;
      await _saveTodos();
      notifyListeners();
    }
  }

  Future<void> deleteTodo(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
    await _saveTodos();
    notifyListeners();
  }

  Future<void> _saveTodos() async {
    final String encoded = json.encode(_todos.map((e) => e.toJson()).toList());
    await StorageService.setString('todos', encoded);
  }
}