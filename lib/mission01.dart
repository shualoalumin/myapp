import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Pad'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButtonRow(['7', '8', '9']),
              const SizedBox(height: 10),
              buildButtonRow(['4', '5', '6']),
              const SizedBox(height: 10),
              buildButtonRow(['1', '2', '3']),
            ],
          ),
        ),
      ),
    );
  }

  Row buildButtonRow(List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: labels.map((label) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            width: 80,
            height: 80,
            color: Colors.grey,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}