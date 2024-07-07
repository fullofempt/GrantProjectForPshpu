import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testik/app/models/childModel.dart';
import 'package:testik/app/models/testresultModel.dart';
import 'package:testik/app/modules/main/views/main_view.dart';
import 'package:testik/app/routes/app_pages.dart';

import '../controllers/test_controller.dart';

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
class TestScreen extends StatefulWidget {
  final Child child;
  final String category;
  final Function(TestResult) onComplete;

  TestScreen(
      {required this.category, required this.child, required this.onComplete});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  List<Map<String, dynamic>> getQuestions(String category) {
    switch (category) {
      case 'Задание 1':
        return [
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/А.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Б.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/БЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/В.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ВЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Г.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ГЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Д.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ДЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Е.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ё.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ж.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/З.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ЗЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/И.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Й.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/К.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/КЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Л.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ЛЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/М.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/МЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Н.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/НЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/О.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/П.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ПЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Р.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/РЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/С.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/СЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Т.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ТЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/У.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ф.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ФЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Х.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/ХЬ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ц.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ч.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ш.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Щ.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ы.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Э.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Ю.png'
          },
          {
            'question': 'Повтори звук...',
            'answer': 'Правильный ответ',
            'image': 'assets/tasks/Я.png'
          },
        ];
      case 'Задание 2':
        return [
          {
            'question': 'Что это?',
            'answer': 'Правильный ответ',
            'image': 'assets/images/yabloko.png'
          },
          {
            'question': 'Какое число?',
            'answer': 'Правильный ответ',
            'image': 'assets/image2.png'
          },
        ];
      case 'Задание 3':
        return [
          {
            'question': 'Что это?',
            'answer': 'Правильный ответ',
            'image': 'assets/images/splash.png'
          },
          {
            'question': 'Какое число?',
            'answer': 'Правильный ответ',
            'image': 'assets/image2.png'
          },
        ];
      default:
        return [];
    }
  }

  late List<Map<String, dynamic>> questions;
  @override
  void initState() {
    super.initState();
    questions = getQuestions(widget.category);
  }

  void nextQuestion(bool isCorrect) {
    if (isCorrect) correctAnswers++;
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _saveResult();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            correctAnswers: correctAnswers,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  Future<void> _saveResult() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('history') ?? [];
    final result = {
      'name': widget.child,
      'correctAnswers': correctAnswers,
      'totalQuestions': questions.length,
      'dateTime': DateTime.now().toString(),
    };
    history.add(jsonEncode(result));
    await prefs.setStringList('history', history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 255, 241),
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 255, 206, 148),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 32,
            shadows: [
              Shadow(
                blurRadius: 3.0,
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          onPressed: () {
            Get.toNamed(Routes.MAIN);
          },
        ),
        flexibleSpace: Center(
          child: Image.asset(
            'assets/images/yar.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(questions[currentQuestionIndex]['question'],
                style: TextStyle(fontSize: 32)),
            SizedBox(
              height: 30,
            ),
            Image.asset(questions[currentQuestionIndex]['image']),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 165,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Color.fromARGB(255, 198, 218, 157),
                      elevation: 4,
                      shadowColor: Colors.grey,
                    ),
                    onPressed: () => nextQuestion(false),
                    child: Text(
                      'Неправильно',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 165,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Color.fromARGB(255, 198, 218, 157),
                      elevation: 4,
                      shadowColor: Colors.grey,
                    ),
                    onPressed: () => nextQuestion(true),
                    child: Text(
                      'Правильно',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  ResultScreen({required this.correctAnswers, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Результаты'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Количество правильных ответов: $correctAnswers из $totalQuestions'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('На главную'),
            ),
          ],
        ),
      ),
    );
  }
}
