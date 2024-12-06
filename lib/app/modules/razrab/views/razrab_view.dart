import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/routes/app_pages.dart';

import '../controllers/razrab_controller.dart';

class RazrabView extends GetView<RazrabController> {
  const RazrabView({Key? key}) : super(key: key);
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
     body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'ФГБОУ ВО "Пермский государственный гуманитарно-педагогический университет"',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Содержание диагностики разработано под руководством:',
                style: TextStyle(fontSize: 15, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'к.ф.н., О.П. Криницына',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Коллектив авторов:',
                style: TextStyle(fontSize: 15, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'к.п.н. О.Н. Гончарова-Тверская',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                'к.п.н. Т.Н. Гирилюк',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Е.Г. Кряжевских',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
               const Text(
                'Программное решение создано под руководством:',
                style: TextStyle(fontSize: 15, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Л.Ю. Худорожков',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Коллектив разработчиков:',
                style: TextStyle(fontSize: 15, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'А.Р. Шлыков',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Text(
                'А.Н. Веприкова',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
