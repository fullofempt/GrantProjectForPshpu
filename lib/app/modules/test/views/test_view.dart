import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/models/childModel.dart';
import 'package:testik/app/models/testresultModel.dart';
import 'package:testik/app/routes/app_pages.dart';

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
      "Zadanie1": [
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/А.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Б.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/БЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/В.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ВЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Г.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ГЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Д.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ДЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Е.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ё.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ж.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/З.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ЗЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/И.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Й.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/К.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/КЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Л.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ЛЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/М.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/МЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Н.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/НЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/О.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/П.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ПЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Р.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/РЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/С.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/СЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Т.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ТЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/У.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ф.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ФЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Х.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/ХЬ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ц.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ч.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ш.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Щ.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ы.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Э.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Ю.png"},
        {"question": "Повтори звук...", "answer": true, "image": "assets/tasks/Я.png"}
      ],
      "Zadanie2": [
        {"question": "Собака", "answer": true, "image": "assets/task2/собака.png"},
        {"question": "Бабушка", "answer": true, "image": "assets/task2/бабушка.png"},
        {"question": "Белка", "answer": true, "image": "assets/task2/белка.png"},
        {"question": "Голова", "answer": true, "image": "assets/task2/голова.png"},
        {"question": "Дверь", "answer": true, "image": "assets/task2/дверь.png"},
        {"question": "Нога", "answer": true, "image": "assets/task2/нога (2).png"},
        {"question": "Сапоги", "answer": true, "image": "assets/task2/сапоги.png"},
        {"question": "Дом", "answer": true, "image": "assets/task2/дом.png"},
        {"question": "Девочка", "answer": true, "image": "assets/task2/девочка.png"},
        {"question": "Ель", "answer": true, "image": "assets/task2/ель.png"},
        {"question": "Ковёр", "answer": true, "image": "assets/task2/ковер.png"},
        {"question": "Пижама", "answer": true, "image": "assets/task2/пижама.png"},
        {"question": "Коза", "answer": true, "image": "assets/task2/коза.png"},
        {"question": "Газета", "answer": true, "image": "assets/task2/газета.png"},
        {"question": "Носки", "answer": true, "image": "assets/task2/носки.png"},
        {"question": "Чай", "answer": true, "image": "assets/task2/чай.png"},
        {"question": "Кошка", "answer": true, "image": "assets/task2/кошка.png"},
        {"question": "Очки", "answer": true, "image": "assets/task2/очки.png"},
        {"question": "Стол", "answer": true, "image": "assets/task2/стол.png"},
        {"question": "Хлеб", "answer": true, "image": "assets/task2/хлеб.png"},
        {"question": "Мальчик", "answer": true, "image": "assets/task2/мальчик.png"},
        {"question": "Мясо", "answer": true, "image": "assets/task2/мясо.png"},
        {"question": "Диван", "answer": true, "image": "assets/task2/диван.png"},
        {"question": "Книга", "answer": true, "image": "assets/task2/книга.png"},
        {"question": "Окно", "answer": true, "image": "assets/task2/окно.png"},
        {"question": "Суп", "answer": true, "image": "assets/task2/суп.png"},
        {"question": "Велосипед", "answer": true, "image": "assets/task2/велосипед.png"},
        {"question": "Тетрадь", "answer": true, "image": "assets/task2/тетрадь.png"},
        {"question": "Рис", "answer": true, "image": "assets/task2/рис.png"},
        {"question": "Нос", "answer": true, "image": "assets/task2/нос.png"},
        {"question": "Такси", "answer": true, "image": "assets/task2/такси.png"},
        {"question": "Автобус", "answer": true, "image": "assets/task2/автобус.png"},
        {"question": "Кровать", "answer": true, "image": "assets/task2/кровать.png"},
        {"question": "Утка", "answer": true, "image": "assets/task2/утка.png"},
        {"question": "Шкаф", "answer": true, "image": "assets/task2/шкаф.png"},
        {"question": "Кефир", "answer": true, "image": "assets/task2/кефир.png"},
        {"question": "Ухо", "answer": true, "image": "assets/task2/ухо.png"},
        {"question": "Духи", "answer": true, "image": "assets/task2/духи.png"},
        {"question": "Отец", "answer": true, "image": "assets/task2/отец.png"},
        {"question": "Учитель", "answer": true, "image": "assets/task2/учитель.png"},
        {"question": "Шапка", "answer": true, "image": "assets/task2/шапка.png"},
        {"question": "Щёки", "answer": true, "image": "assets/task2/щеки.png"},
        {"question": "Сыр", "answer": true, "image": "assets/task2/сыр.png"},
        {"question": "Шоссе", "answer": true, "image": "assets/task2/шоссе.png"},
        {"question": "Юбка", "answer": true, "image": "assets/task2/юбка.png"},
        {"question": "Яблоко", "answer": true, "image": "assets/task2/яблоко.png"}
      ],
      "Zadanie3": [
        {"question": "Повтори за мной слоги:", "answer": true, "image": "assets/task3/paba.png"},
        {"question": "Повтори за мной слоги:", "answer": true, "image": "assets/task3/САША.png"},
        {"question": "Повтори за мной слоги:", "answer": true, "image": "assets/task3/кагака.png"},
        {"question": "Повтори за мной слоги:", "answer": true, "image": "assets/task3/шажаша.png"},
        {"question": "Повтори за мной слоги:", "answer": true, "image": "assets/task3/РАРЯЛАЛЯ.png"},
        {"question": "Повтори за мной слова (без опоры на картинки):", "answer": true, "image": "assets/task3/КОТГОД.png"},
        {"question": "Повтори за мной слова (без опоры на картинки):", "answer": true, "image": "assets/task3/ДОМКОТ.png"},
        {"question": "Повтори за мной слова (без опоры на картинки):", "answer": true, "image": "assets/task3/БАБУШКА.png"},
        {"question": "Повтори за мной слова (без опоры на картинки):", "answer": true, "image": "assets/task3/ТРАНСПОРТ.png"},
        {"question": "Повтори за мной слова (без опоры на картинки):", "answer": true, "image": "assets/task3/ТЕЛЕВИЗОР.png"},
        {"question": "Повтори за мной предложения:", "answer": true, "image": "assets/task3/КОШКАЛОВИТМЫШКУ.png"},
        {"question": "Повтори за мной предложения:", "answer": true, "image": "assets/task3/ЗОХИДГОНИТКОЗУ.png"},
        {"question": "Повтори за мной предложения:", "answer": true, "image": "assets/task3/ЛОЛАРУХВАРИТПЛОВ.png"},
        {"question": "Назови первый звук в слове:", "answer": true, "image": "assets/task3/УТКА.png"},
        {"question": "Назови первый звук в слове:", "answer": true, "image": "assets/task3/КОШКА.png"},
        {"question": "Назови последний звук в слове:", "answer": true, "image": "assets/task3/МАК.png"},
        {"question": "Назови последний звук в слове:", "answer": true, "image": "assets/task3/ВОДА.png"},
        {"question": "Хлопни в ладоши столько раз, сколько звуков в слове:", "answer": true, "image": "assets/task3/ДОМ.png"},
        {"question": "Хлопни в ладоши столько раз, сколько звуков в слове:", "answer": true, "image": "assets/task3/КНИГА.png"},
        {"question": "Послушай звуки и составь из них слово:", "answer": true, "image": "assets/task3/СОК.png"},
        {"question": "Послушай звуки и составь из них слово:", "answer": true, "image": "assets/task3/РУКА.png"},
        {"question": "Назови слова по картинкам и скажи, какими звуками они отличаются:", "answer": true, "image": "assets/task3/domdim.png"},
        {"question": "Назови слова по картинкам и скажи, какими звуками они отличаются:", "answer": true, "image": "assets/task3/stolstyl.png"},
        {"question": "Назови слова по картинкам и скажи, какими звуками они отличаются:", "answer": true, "image": "assets/task3/mashinamalina.png"}
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
          contentPadding: EdgeInsets.zero,
          content: Container(
            color: Color.fromARGB(255, 198, 218, 157), 
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Результаты теста",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 16.0),
                Text("Количество правильных ответов: $_correctAnswersCount"),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("OK",
              style: TextStyle(color: Colors.black),),
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
      backgroundColor: Color.fromARGB(255, 251, 255, 242),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _questions[_currentQuestionIndex]['question'],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                _questions[_currentQuestionIndex]['image'],
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color.fromARGB(255, 198, 218, 157),
                    elevation: 4,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: () => _answerQuestion(false),
                  child: Text(
                    "Неправильно",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 22,
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
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color.fromARGB(255, 198, 218, 157),
                    elevation: 4,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: () => _answerQuestion(true),
                  child: Text(
                    "Правильно",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 22,
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
        ),
      ),
    );
  }
}
