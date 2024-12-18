import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '플러터 앱 만들기'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  void pressedButton(){
    print('버튼이 눌렸습니다.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: 
        Row(
          children:[
          Expanded(
            flex : 1,
            child: Container(
              alignment: Alignment.center,
              child : Icon(Icons.menu)
            )
          ),
          
          Expanded(
            flex : 9,
            child: Container(
              alignment: Alignment.center,
              child : Text(widget.title)
            )
          ),
          
        
          
          ]
          )
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            SizedBox(height:64),
            ElevatedButton(
              onPressed: pressedButton,
              child: Text('Text'),
            ),
            SizedBox(height:64),
            Stack(
              children : [
                Container(
                  color: Colors.blue,
                  width: 300,
                  height: 300,
                ),
                Container(
                  color: Colors.red,
                  width: 240,
                  height: 240,
                ),
                Container(
                  color: Colors.yellow,
                  width: 180,
                  height: 180,
                ),
                Container(
                  color: Colors.green,
                  width: 120,
                  height: 120,
                ),
                Container(
                  color: Colors.black,
                  width: 60,
                  height: 60,
                ),
              ]
            )
          ]
        )
      )
    


    );
  }
}
