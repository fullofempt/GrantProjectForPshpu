import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/models/childModel.dart';
import 'package:testik/app/routes/app_pages.dart';

import '../controllers/viborzad_controller.dart';

class CategorySelectionScreen extends StatelessWidget {
  final Child child;
  final Function(String) onCategorySelected;

  CategorySelectionScreen(
      {required this.child, required this.onCategorySelected});

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
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: 350,
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Color.fromARGB(255, 255, 206, 148),
                elevation: 4,
                shadowColor: Colors.grey,
              ),
              onPressed: () => onCategorySelected("Zadanie1"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 16),
                  Text(
                    '1 Задание',
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
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 350,
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Color.fromARGB(255, 255, 206, 148),
                elevation: 4,
                shadowColor: Colors.grey,
              ),
              onPressed: () => onCategorySelected("Zadanie2"),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 16),
                    Text(
                      '2 Задание',
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
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 350,
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Color.fromARGB(255, 255, 206, 148),
                elevation: 4,
                shadowColor: Colors.grey,
              ),
              onPressed: () => onCategorySelected("Zadanie3"),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 16),
                    Text(
                      '3 Задание',
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
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(height: 20),
          // Container(
          //   width: 350,
          //   height: 100,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       backgroundColor: Color.fromARGB(255, 255, 206, 148),
          //       elevation: 4,
          //       shadowColor: Colors.grey,
          //     ),
          //     onPressed: () => onCategorySelected("Zadanie4"),
          //     child: Center(
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: <Widget>[
          //           SizedBox(width: 16),
          //           Text(
          //             '4 Задание',
          //             style: TextStyle(
          //                 color: Color.fromARGB(255, 255, 255, 255),
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.w600,
          //                 shadows: [
          //                   Shadow(
          //                     blurRadius: 2.0,
          //                     color: Colors.grey,
          //                     offset: Offset(1.0, 1.0),
          //                   )
          //                 ]),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 20),
          Container(
            width: 350,
            height: 100,
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
                // Открываем подокно с выбором возраста
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text("Выберите возраст"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () => onCategorySelected("Zadanie4.1"),
                            child: Text("3-6 лет"),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => onCategorySelected("Zadanie4.2"),
                            child: Text("6-7 лет"),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => onCategorySelected("Zadanie4.3"),
                            child: Text("7-9 лет"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 16),
                    Text(
                      '4 Задание',
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
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}
