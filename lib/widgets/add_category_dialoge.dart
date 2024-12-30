import 'package:flutter/material.dart';

class AddCategoryDialog extends StatefulWidget {
  final Function(String, IconData, Color) onAdd;

  const AddCategoryDialog({
    super.key,
    required this.onAdd,
  });

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final _titleController = TextEditingController();
  final IconData _selectedIcon = Icons.folder;
  final Color _selectedColor = Colors.blue;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Category'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Category Name',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(_selectedIcon),
                onPressed: _showIconPicker,
              ),
              IconButton(
                icon: Icon(Icons.color_lens, color: _selectedColor),
                onPressed: _showColorPicker,
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              widget.onAdd(_titleController.text, _selectedIcon, _selectedColor);
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _showIconPicker() {
    // Implement icon picker
  }

  void _showColorPicker() {
    // Implement color picker
  }
}