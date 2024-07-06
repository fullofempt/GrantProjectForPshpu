class Task {
  final String name;
  final String imageUrl;

  Task({
    required this.name,
    required this.imageUrl,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

class TestResult {
  final String taskName;
  final bool isCorrect;

  TestResult({
    required this.taskName,
    required this.isCorrect,
  });
}
