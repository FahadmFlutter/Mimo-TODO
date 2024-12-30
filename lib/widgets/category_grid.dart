import 'package:flutter/material.dart';
import '../models/category.dart';
import 'category_tile.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;
  final Function(Category) onCategoryTap;

  const CategoryGrid({
    super.key,
    required this.categories,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: categories
          .map((category) => CategoryTile(
        category: category,
        onTap: () => onCategoryTap(category),
      ))
          .toList(),
    );
  }
}