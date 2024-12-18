import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: TestScreen()
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {
  bool isDarkMode = false;      // 다크모드 상태
  bool isNotificationOn = true; // 알림 받기 상태

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정 화면'),
        backgroundColor: isDarkMode ? Colors.black : null,
      ),
      body: Container(
        color: isDarkMode ? Colors.black : Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20),
            // 알림 받기 옵션 (Checkbox)
            Row(
              children: [
                Checkbox(
                  value: isNotificationOn,
                  onChanged: (bool? value) {
                    setState(() {
                      isNotificationOn = value ?? false;
                      print('알림 받기 상태: $isNotificationOn');
                    });
                  }
                ),
                Text(
                  '알림 받기',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            // 다크 모드 옵션 (Switch)
            Row(
              children: [
                Switch(
                  value: isDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      isDarkMode = value;
                      print('다크 모드 상태: $isDarkMode');
                    });
                  },
                ),
                Text(
                  '다크 모드',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
