import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testik/app/models/childModel.dart';
import 'package:testik/app/models/testresultModel.dart';
import 'package:testik/app/modules/history/views/history_view.dart';
import 'package:testik/app/modules/registration/views/registration_view.dart';
import 'package:testik/app/modules/test/views/test_view.dart';
import 'package:testik/app/modules/viborzad/views/viborzad_view.dart';
import 'package:testik/app/routes/app_pages.dart';

import '../controllers/main_controller.dart';

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
    String resultsString =
        json.encode(results.map((result) => result.toJson()).toList());
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
      backgroundColor: const Color.fromARGB(255, 198, 218, 157),
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 255, 206, 148),
        automaticallyImplyLeading: false,
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
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 350,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 206, 148),
                    elevation: 4,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RegistrationScreen(onRegister: _registerChild),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/plus.png',
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Регистрация ребёнка",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.grey,
                                offset: Offset(2.0, 2.0),
                              )
                            ]),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color.fromARGB(255, 255, 206, 148),
                  elevation: 4,
                  shadowColor: Colors.grey,
                ),
                onPressed: children.isNotEmpty
                    ? () => _selectCategory(children.last)
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/yabloko.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Пройти тест",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color.fromARGB(255, 255, 206, 148),
                  elevation: 4,
                  shadowColor: Colors.grey,
                ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/yabloko.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "История результатов",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color.fromARGB(255, 255, 206, 148),
                  elevation: 4,
                  shadowColor: Colors.grey,
                ),
                onPressed: () {
                  Get.toNamed(Routes.SPRAVKA);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/yabloko.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Справка",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color.fromARGB(255, 255, 206, 148),
                  elevation: 4,
                  shadowColor: Colors.grey,
                ),
                onPressed: () {
                  Get.toNamed(Routes.RAZRAB);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/yabloko.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Разработчики",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
