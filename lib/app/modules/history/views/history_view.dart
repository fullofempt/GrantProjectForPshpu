import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testik/app/models/testresultModel.dart';

import '../controllers/history_controller.dart';

class HistoryScreen extends StatefulWidget {
  final List<TestResult> results;
  final Function(List<TestResult>) onUpdateResults;

  HistoryScreen({required this.results, required this.onUpdateResults});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<TestResult> _filteredResults;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredResults = widget.results;
    _searchController.addListener(_filterResults);
  }

  void _filterResults() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredResults = widget.results.where((result) {
        return result.childFullName.toLowerCase().contains(query) ||
            result.category.toLowerCase().contains(query) ||
            DateFormat('yyyy-MM-dd – kk:mm').format(result.dateTime).contains(query);
      }).toList();
    });
  }

  void _deleteResult(int index) {
    setState(() {
      widget.results.removeAt(index);
      _filteredResults = widget.results;
      widget.onUpdateResults(widget.results);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("История")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Поиск",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredResults.length,
              itemBuilder: (context, index) {
                TestResult result = _filteredResults[index];
                String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(result.dateTime);
                return ListTile(
                  title: Text(result.childFullName),
                  subtitle: Text("Категория: ${result.category}, Правильных ответов: ${result.correctAnswers}, Дата: $formattedDate"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteResult(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
