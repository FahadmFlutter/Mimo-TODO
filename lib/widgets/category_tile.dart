import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(category.icon, size: 32, color: category.color),
              const SizedBox(height: 8),
              Text(category.title),
            ],
          ),
        ),
      ),
    );
  }
}