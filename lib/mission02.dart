import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('mission02'),
        ),

        body: Center(
          child: Stack(
            children: [
              Container(
                width: 300,
                height: 200,
                color: Colors.blue,
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Text(
                  'Hello, Flutter!',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              // ... existing Positioned and Align widgets ...
            ],
          ),
        ),
      ),
    );
  }
}