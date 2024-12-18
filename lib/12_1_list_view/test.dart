import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> _todoList = List.generate(
    10,
    (index) => {
      'title': '할 일 ${index + 1}',
      'isCompleted': false,
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 240, 237, 203)),
          checkColor: MaterialStateProperty.all(Colors.black),
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.tealAccent,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[800],
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Checkbox(
                  value: _todoList[index]['isCompleted'],
                  onChanged: (value) {
                    setState(() {
                      _todoList[index]['isCompleted'] = value!;
                    });
                  },
                ),
                title: Text(
                  _todoList[index]['title'],
                  style: TextStyle(
                    decoration: _todoList[index]['isCompleted']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                onTap: () {
                  print('항목 세부 정보: ${_todoList[index]}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
