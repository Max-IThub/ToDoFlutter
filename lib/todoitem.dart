class TodoItem {
  String title;
  bool isCompleted;
  String? description;

  TodoItem(
      {required this.title,
      required this.isCompleted,
      required this.description});

  Map<String, dynamic> toJson() => {
        'title': title,
        'isCompleted': isCompleted,
        'description': description,
      };

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
        title: json['title'],
        isCompleted: json['isCompleted'],
        description: json['description'],
      );
}
