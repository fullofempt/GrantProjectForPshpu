class TestResult {
  final String childFullName;
  final String category;
  final int correctAnswers;
  final DateTime dateTime;

  TestResult(this.childFullName, this.category, this.correctAnswers, this.dateTime);

  Map<String, dynamic> toJson() => {
        'childFullName': childFullName,
        'category': category,
        'correctAnswers': correctAnswers,
        'dateTime': dateTime.toIso8601String(),
      };

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      json['childFullName'],
      json['category'],
      json['correctAnswers'],
      DateTime.parse(json['dateTime']),
    );
  }
}