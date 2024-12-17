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
              title: const Text('Test'),
            ),

            body: Column(
              children: [
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(color: Colors.red, width: 50, height: 50.0),
                      Container(color: Colors.green, width: 150.0, height: 150.0),
                      Container(color: Colors.blue, width: 100, height: 100.0,),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: 300,
                      maxHeight: 50
                  ),
                  child: Container(color: Colors.amber, width: 150, height: 150.0),
                )
              ],
            )
        )
    );
  }
}