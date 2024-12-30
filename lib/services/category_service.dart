
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryService {
  final List<Category> _categories = [
    Category(
      id: '1',
      title: 'Home',
      icon: Icons.home,
      color: Colors.blue,
    ),
    Category(
      id: '2',
      title: 'Sports',
      icon: Icons.sports_baseball,
      color: Colors.green,
    ),
    Category(
      id: '3',
      title: 'Homework',
      icon: Icons.home_work,
      color: Colors.orange,
    ),
    Category(
      id: '4',
      title: 'E-learning',
      icon: Icons.book,
      color: Colors.red,
    ),
    Category(
      id: '5',
      title: 'Shopping',
      icon: Icons.shopping_bag_rounded,
      color: Colors.purple,
    ),
    Category(
      id: '6',
      title: 'Food',
      icon: Icons.local_pizza,
      color: Colors.tealAccent,
    ),
    Category(
      id: '7',
      title: 'Design',
      icon: Icons.color_lens,
      color: Colors.yellow,
    ),
  ];

  List<Category> getCategories() => List.unmodifiable(_categories);

  Category? getCategoryById(String id) {
    try {
      return _categories.firstWhere((category) => category == id);
    } catch (_) {
      return null;
    }
  }
}