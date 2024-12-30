import 'package:flutter/material.dart';
import 'package:mimo_todo/screens/task_screen.dart';
import '../models/category.dart';
import '../services/category_service.dart';
import '../widgets/add_category_dialoge.dart';
import '../widgets/category_grid.dart';
import 'settings_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoryService _categoryService = CategoryService();

  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) => AddCategoryDialog(
        onAdd: (title, icon, color) {
          // Implement add category logic
        },
      ),
    );
  }

  void _navigateToTasks(Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TasksScreen(categoryId: category.id,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = _categoryService.getCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        leading:
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
      ),
      body: CategoryGrid(
        categories: categories,
        onCategoryTap: _navigateToTasks,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showAddCategoryDialog,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}