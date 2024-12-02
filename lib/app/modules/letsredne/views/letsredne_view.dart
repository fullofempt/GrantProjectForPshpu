import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/routes/app_pages.dart';

import '../controllers/letsredne_controller.dart';

class LetsredneView extends GetView<LetsredneController> {
  const LetsredneView({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 218, 157),
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
            Get.toNamed(Routes.SPRAVKA);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  '6-7 лет',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 1.0),
                        )
                      ]),
                ),
                SizedBox(height: 16),
                Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(3),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 206, 148)),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Уровень речевого развития',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Баллы',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Рекомендации',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(253, 255, 243, 237)),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Низкий'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('0-80 баллов'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Ребенок должен быть обследован психоневрологом или невропатологом.  Требуются консультации дефектолога, логопеда, коррекционно-развивающие занятия.  Необходимо заключение ПМПК для выбора образовательного маршрута. РКИ '),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(253, 255, 243, 237)),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Средний'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('81-137 баллов'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Требуются консультации дефектолога, логопеда, коррекционно-развивающие занятия.  Необходимо заключение ПМПК для точного выбора образовательного маршрута. РКИ '),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(253, 255, 243, 237)),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Высокий'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('138-166 баллов'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Обучение по программе, соответствующей возрасту. Нуждается в логопедической помощи для совершенствования навыков речевого развития на русском языке.'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
