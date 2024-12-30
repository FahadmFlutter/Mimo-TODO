
import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/category.dart';
import '../services/storage_service.dart';


class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => List.unmodifiable(_categories);

  Future<void> loadCategories() async {
    final categoriesJson = await StorageService.getString('categories');
    if (categoriesJson != null) {
      final List<dynamic> decoded = json.decode(categoriesJson);
      _categories = decoded.map((item) => Category.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> addCategory(String title, IconData icon, Color color) async {
    final category = Category(
      id: DateTime.now().toString(),
      title: title,
      icon: icon,
      color: color,
    );
    _categories.add(category);
    await _saveCategories();
    notifyListeners();
  }

  Category? getCategoryById(String id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> _saveCategories() async {
    final String encoded = json.encode(_categories.map((e) => e.toJson()).toList());
    await StorageService.setString('categories', encoded);
  }
}