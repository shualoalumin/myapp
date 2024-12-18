import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyApp>
    with SingleTickerProviderStateMixin {  //탭 화면 변경됐을 때 애니메이션 효과 
  late TabController controller; // 탭 버튼을 눌렀을 때 본문 제어하는 컨트롤러

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this); // 현재 상태 객체(this)를 vsync로 SingleTickerProviderStateMixin과 연결
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Tab Test'),
        // bottom: TabBar(
        //         controller: controller,
        //         tabs: const <Widget>[
        //           Tab(text: 'One'),
        //           Tab(text: 'Two'),
        //           Tab(text: 'Three'),
        //         ],
        //       ),
      ),
      body: TabBarView(
        controller: controller, // TabBar 와 연결
        children: const <Widget>[
          Center(
            child: Text(
              '홈',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              '검색',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              '프로필',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),


    
      bottomNavigationBar: TabBar( 
        controller: controller, // TabBarView 와 연결
        tabs: const <Widget>[
          Tab(
            icon: Icon(Icons.home),
            text: '홈',
          ),
          Tab(
            icon: Icon(Icons.search),
            text: '검색',
          ),
          Tab(
            icon: Icon(Icons.person),
            text: '프로필',
          ),
        ],
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.transparent,
      ),
    ));
  }
}
