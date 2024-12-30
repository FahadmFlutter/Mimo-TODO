class Todo {
  final String id;
  final String title;
  final String categoryId;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.categoryId,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'categoryId': categoryId,
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      categoryId: json['categoryId'],
      isCompleted: json['isCompleted'],
    );
  }
}