import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/models/childModel.dart';
import 'package:testik/app/models/taskModel.dart';
import 'package:testik/app/routes/app_pages.dart';

import '../controllers/registration_controller.dart';

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
  List<Child> children = [];
  List<TestResult> results = [];

  

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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: 'ФИО',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 206, 148)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 206, 148)),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                style: TextStyle(color: const Color.fromARGB(255, 60, 60, 60)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Пожалуйста, введите ФИО";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Возраст',
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 206, 148)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 206, 148)),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: const Color.fromARGB(255, 60, 60, 60)),
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
              Container(
                width: 200,
                height: 50,
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
                    if (_formKey.currentState!.validate()) {
                      widget.onRegister(Child(
                        _fullNameController.text,
                        int.parse(_ageController.text),
                      ));
                      
                      Navigator.pop(context);
                    }
                  },
                  
                  child: Text(
                    "Регистрация",
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
