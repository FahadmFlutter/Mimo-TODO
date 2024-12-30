import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final IconData icon;
  final Color color;

  Category({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'iconName': _iconDataToName(icon),
      'colorValue': color.value,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      icon: _nameToIconData(json['iconName']),
      color: Color(json['colorValue']),
    );
  }

  static String _iconDataToName(IconData iconData) {
    return _iconMap.entries
        .firstWhere((entry) => entry.value == iconData, orElse: () => const MapEntry('default', Icons.help))
        .key;
  }

  static IconData _nameToIconData(String name) {
    return _iconMap[name] ?? Icons.help;
  }

  static const Map<String, IconData> _iconMap = {
    'home': Icons.home,
    'work': Icons.work,
    'settings': Icons.settings,
    // Add more icon mappings as needed
  };
}
