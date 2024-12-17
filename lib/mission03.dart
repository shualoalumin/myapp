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
            body: const TestScreen()
        )
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<TestScreen> {

  final _formKey = GlobalKey<FormState>();
  String? userName;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Form Test'),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'User Name'
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user name';
                  }
                  return null;
                },
                onSaved: (String? value){
                  userName = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Email'
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  // 간단한 이메일 형식 검증
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (String? value){
                  email = value;
                },
              ),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: (){
              if(_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                print('User Name: $userName, Email : $email');
                setState(() {}); // 화면 갱신
              }
            },
            child: const Text('submit')
        ),
        // 입력값 화면 표시 위젯 추가
        if (userName != null && email != null)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text('User Name: $userName'),
                Text('Email: $email'),
              ],
            ),
          ),
      ],
    );
  }
}
