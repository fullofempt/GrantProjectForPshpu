import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testik/app/models/childModel.dart';

import '../controllers/viborzad_controller.dart';

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
