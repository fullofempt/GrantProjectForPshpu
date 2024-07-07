// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:testik/app/models/childModel.dart';
// import 'package:testik/app/models/testresultModel.dart';

// import '../controllers/test_controller.dart';

// class TestScreen extends StatefulWidget {
//   final Child child;
//   final String category;
//   final Function(TestResult) onComplete;

//   TestScreen({required this.child, required this.category, required this.onComplete});

//   @override
//   _TestScreenState createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   List<Map<String, dynamic>> _questions = [];
//   List<bool> _answers = [];
//   List<bool> _correctAnswers = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadQuestions();
//   }

//   void _loadQuestions() {
//     String jsonString = '''
//     {
//       "Math": [
//         {"question": "2 + 2 = 4?", "answer": true},
//         {"question": "5 + 3 = 9?", "answer": false}
//       ],
//       "Science": [
//         {"question": "Земля круглая?", "answer": true},
//         {"question": "Солнце вращается вокруг Земли?", "answer": false}
//       ],
//       "History": [
//         {"question": "Первый президент США - Джордж Вашингтон?", "answer": true},
//         {"question": "Столица Франции - Рим?", "answer": false}
//       ]
//     }
//     ''';
//     Map<String, dynamic> data = json.decode(jsonString);
//     _questions = List<Map<String, dynamic>>.from(data[widget.category]);
//     _answers = List<bool>.filled(_questions.length, false);
//     _correctAnswers = List<bool>.filled(_questions.length, false);
//   }

//   void _showResult() {
//     int correctAnswers = 0;
//     for (int i = 0; i < _questions.length; i++) {
//       if (_correctAnswers[i]) {
//         correctAnswers++;
//       }
//     }

//     DateTime now = DateTime.now();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Результаты теста"),
//           content: Text("Количество правильных ответов: $correctAnswers"),
//           actions: [
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 widget.onComplete(TestResult(widget.child.fullName, widget.category, correctAnswers, now));
//                 Navigator.pop(context);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Тест: ${widget.category}")),
//       body: ListView.builder(
//         itemCount: _questions.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_questions[index]["question"]),
//             subtitle: Row(
//               children: [
//                 Text("Правда"),
//                 Checkbox(
//                   value: _answers[index] == true,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       _answers[index] = true;
//                       _correctAnswers[index] = value == _questions[index]['answer'];
//                     });
//                   },
//                 ),
//                 Text("Ложь"),
//                 Checkbox(
//                   value: _answers[index] == false,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       _answers[index] = false;
//                       _correctAnswers[index] = value != _questions[index]['answer'];
//                     });
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showResult,
//         child: Icon(Icons.check),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/models/childModel.dart';
import 'package:testik/app/models/testresultModel.dart';

import '../controllers/test_controller.dart';

class TestScreen extends StatefulWidget {
  final Child child;
  final String category;
  final Function(TestResult) onComplete;

  TestScreen(
      {required this.child, required this.category, required this.onComplete});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Map<String, dynamic>> _questions = [];
  List<bool> _answers = [];
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    String jsonString = '''
    {
      "Math": [
        {"question": "2 + 2 = 4?", "answer": true, "image": "assets/math1.png"},
        {"question": "5 + 3 = 9?", "answer": true, "image": "assets/math2.png"},
        {"question": "5 + 3 = 9?", "answer": true, "image": "assets/math2.png"},
        {"question": "5 + 3 = 9?", "answer": true, "image": "assets/math2.png"},
        {"question": "5 + 3 = 9?", "answer": true, "image": "assets/math2.png"}
      ],
      "Science": [
        {"question": "Земля круглая?", "answer": true, "image": "assets/science1.png"},
        {"question": "Солнце вращается вокруг Земли?", "answer": true, "image": "assets/science2.png"}
      ],
      "History": [
        {"question": "Первый президент США - Джордж Вашингтон?", "answer": true, "image": "assets/history1.png"},
        {"question": "Столица Франции - Рим?", "answer": false, "image": "assets/history2.png"}
      ]
    }
    ''';
    Map<String, dynamic> data = json.decode(jsonString);
    _questions = List<Map<String, dynamic>>.from(data[widget.category]);
    _answers = List<bool>.filled(_questions.length, false);
  }

  void _answerQuestion(bool answer) {
    if (_questions[_currentQuestionIndex]['answer'] == answer) {
      _correctAnswersCount++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    DateTime now = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Результаты теста"),
          content: Text("Количество правильных ответов: $_correctAnswersCount"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                widget.onComplete(TestResult(widget.child.fullName,
                    widget.category, _correctAnswersCount, now));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_questions[_currentQuestionIndex]['image']),
            SizedBox(height: 20),
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _answerQuestion(false),
                  child: Text("Неправильно"),
                ),
                ElevatedButton(
                  onPressed: () => _answerQuestion(true),
                  child: Text("Правильно"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
