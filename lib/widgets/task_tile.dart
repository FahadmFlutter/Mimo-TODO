import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final VoidCallback? onMoreTap;

  const TaskTile({
    super.key,
    required this.title,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_circle_outline),
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: onMoreTap,
      ),
    );
  }
}