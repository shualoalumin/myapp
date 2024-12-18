import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: ScoreTableScreen(),
    title: 'TOEFL Score',
    theme: ThemeData(primarySwatch: Colors.blue),
  ));
}

class ScoreTableScreen extends StatefulWidget {
  const ScoreTableScreen({super.key});

  @override
  _ScoreTableScreenState createState() => _ScoreTableScreenState();
}

class _ScoreTableScreenState extends State<ScoreTableScreen> {
  List<dynamic> scores = [];
  String filterType = "전체";

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      setState(() {
        scores = json.decode(response);
      });
    } catch (e) {
      print("Error loading data: \$e");
    }
  }

  List<DataRow> _buildFilteredRows() {
    if (filterType == "전체") {
      return scores.map((student) => _buildDataRow(student)).toList();
    }

    if (filterType == "학년 평균") {
      return _buildGradeAverages();
    }

    return [];
  }

  DataRow _buildDataRow(student) {
    return DataRow(cells: [
      DataCell(Text(student['학년'].toString())),
      DataCell(Text(student['이름'])),
      DataCell(Text(student['R'].toString())),
      DataCell(Text(student['L'].toString())),
      DataCell(Text(student['S'].toString())),
      DataCell(Text(student['W'].toString())),
      DataCell(Text(student['TOTAL'].toString())),
    ]);
  }

  List<DataRow> _buildGradeAverages() {
    Map<int, List<int>> gradeScores = {};

    for (var student in scores) {
      int grade = student['학년'];
      int total = student['TOTAL'];
      gradeScores.putIfAbsent(grade, () => []).add(total);
    }

    return gradeScores.entries.map((entry) {
      int grade = entry.key;
      double average = entry.value.reduce((a, b) => a + b) / entry.value.length;

      return DataRow(cells: [
        DataCell(Text('학년 $grade')),
        const DataCell(Text('')),
        const DataCell(Text('')),
        const DataCell(Text('')),
        const DataCell(Text('')),
        const DataCell(Text('')),
        DataCell(Text(average.toStringAsFixed(2))),
      ]);
    }).toList();
  }

  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => setState(() => filterType = "전체"),
          child: const Text('전체 성적'),
        ),
        ElevatedButton(
          onPressed: () => setState(() => filterType = "학년 평균"),
          child: const Text('학년 평균'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('학생 성적표')),
      body: Column(
        children: [
          _buildFilterButtons(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('학년')),
                  DataColumn(label: Text('이름')),
                  DataColumn(label: Text('R')),
                  DataColumn(label: Text('L')),
                  DataColumn(label: Text('S')),
                  DataColumn(label: Text('W')),
                  DataColumn(label: Text('TOTAL')),
                ],
                rows: _buildFilteredRows(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
