import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


class HistoryScreen extends StatefulWidget {
  final List<TestResult> results;
  final Function(List<TestResult>) onUpdateResults;

  HistoryScreen({required this.results, required this.onUpdateResults});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<TestResult> _filteredResults;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredResults = widget.results;
    _searchController.addListener(_filterResults);
  }

  void _filterResults() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredResults = widget.results.where((result) {
        return result.childFullName.toLowerCase().contains(query) ||
            result.category.toLowerCase().contains(query) ||
            DateFormat('yyyy-MM-dd – kk:mm').format(result.dateTime).contains(query);
      }).toList();
    });
  }

  void _deleteResult(int index) {
    setState(() {
      widget.results.removeAt(index);
      _filteredResults = widget.results;
      widget.onUpdateResults(widget.results);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("История")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Поиск",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredResults.length,
              itemBuilder: (context, index) {
                TestResult result = _filteredResults[index];
                String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(result.dateTime);
                return ListTile(
                  title: Text(result.childFullName),
                  subtitle: Text("Категория: ${result.category}, Правильных ответов: ${result.correctAnswers}, Дата: $formattedDate"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteResult(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Тестирование детей',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Child> children = [];
  List<TestResult> results = [];

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? resultsString = prefs.getString('results');
    if (resultsString != null) {
      setState(() {
        results = (json.decode(resultsString) as List)
            .map((data) => TestResult.fromJson(data))
            .toList();
      });
    }
  }

  Future<void> _saveResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String resultsString = json.encode(results.map((result) => result.toJson()).toList());
    prefs.setString('results', resultsString);
  }

  void _registerChild(Child child) {
    setState(() {
      children.add(child);
    });
  }

  void _completeTest(TestResult result) {
    setState(() {
      results.add(result);
      _saveResults();
    });
  }

  void _selectCategory(Child child) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategorySelectionScreen(
          child: child,
          onCategorySelected: (category) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TestScreen(
                  child: child,
                  category: category,
                  onComplete: _completeTest,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _updateResults(List<TestResult> updatedResults) {
    setState(() {
      results = updatedResults;
      _saveResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Главный экран")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationScreen(onRegister: _registerChild),
                ),
              );
            },
            child: Text("Регистрация ребёнка"),
          ),
          ElevatedButton(
            onPressed: children.isNotEmpty
                ? () => _selectCategory(children.last)
                : null,
            child: Text("Пройти тест"),
          ),
          ElevatedButton(
            onPressed: results.isNotEmpty
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryScreen(
                          results: results,
                          onUpdateResults: _updateResults,
                        ),
                      ),
                    );
                  }
                : null,
            child: Text("История результатов"),
          ),
        ],
      ),
    );
  }
}


class RegistrationScreen extends StatefulWidget {
  final Function(Child) onRegister;

  RegistrationScreen({required this.onRegister});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Регистрация")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: "ФИО"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Пожалуйста, введите ФИО";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: "Возраст"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Пожалуйста, введите возраст";
                  }
                  if (int.tryParse(value) == null) {
                    return "Пожалуйста, введите корректный возраст";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onRegister(Child(
                      _fullNameController.text,
                      int.parse(_ageController.text),
                    ));
                    Navigator.pop(context);
                  }
                },
                child: Text("Регистрация"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CategorySelectionScreen extends StatelessWidget {
  final Child child;
  final Function(String) onCategorySelected;

  CategorySelectionScreen({required this.child, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Выбор категории")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Математика"),
            onTap: () => onCategorySelected("Math"),
          ),
          ListTile(
            title: Text("Наука"),
            onTap: () => onCategorySelected("Science"),
          ),
          ListTile(
            title: Text("История"),
            onTap: () => onCategorySelected("History"),
          ),
        ],
      ),
    );
  }
}


class TestScreen extends StatefulWidget {
  final Child child;
  final String category;
  final Function(TestResult) onComplete;

  TestScreen({required this.child, required this.category, required this.onComplete});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Map<String, dynamic>> _questions = [];
  List<bool> _answers = [];
  List<bool> _correctAnswers = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    String jsonString = '''
    {
      "Math": [
        {"question": "2 + 2 = 4?", "answer": true},
        {"question": "5 + 3 = 9?", "answer": false}
      ],
      "Science": [
        {"question": "Земля круглая?", "answer": true},
        {"question": "Солнце вращается вокруг Земли?", "answer": false}
      ],
      "History": [
        {"question": "Первый президент США - Джордж Вашингтон?", "answer": true},
        {"question": "Столица Франции - Рим?", "answer": false}
      ]
    }
    ''';
    Map<String, dynamic> data = json.decode(jsonString);
    _questions = List<Map<String, dynamic>>.from(data[widget.category]);
    _answers = List<bool>.filled(_questions.length, false);
    _correctAnswers = List<bool>.filled(_questions.length, false);
  }

  void _showResult() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_correctAnswers[i]) {
        correctAnswers++;
      }
    }

    DateTime now = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Результаты теста"),
          content: Text("Количество правильных ответов: $correctAnswers"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                widget.onComplete(TestResult(widget.child.fullName, widget.category, correctAnswers, now));
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Тест: ${widget.category}")),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_questions[index]["question"]),
            subtitle: Row(
              children: [
                Text("Правда"),
                Checkbox(
                  value: _answers[index] == true,
                  onChanged: (bool? value) {
                    setState(() {
                      _answers[index] = true;
                      _correctAnswers[index] = value == _questions[index]['answer'];
                    });
                  },
                ),
                Text("Ложь"),
                Checkbox(
                  value: _answers[index] == false,
                  onChanged: (bool? value) {
                    setState(() {
                      _answers[index] = false;
                      _correctAnswers[index] = value != _questions[index]['answer'];
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showResult,
        child: Icon(Icons.check),
      ),
    );
  }
}
