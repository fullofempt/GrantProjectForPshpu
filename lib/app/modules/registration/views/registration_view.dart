import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/models/childModel.dart';

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