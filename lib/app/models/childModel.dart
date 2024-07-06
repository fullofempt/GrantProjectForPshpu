class Child {
  final String fullName;
  final int age;

  Child(this.fullName, this.age);

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'age': age,
      };

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      json['fullName'],
      json['age'],
    );
  }
}