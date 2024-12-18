import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // 다크 테마 적용
      home: Scaffold(
        appBar: AppBar(
          title: const Text('삭제 확인 예제'),
        ),
        body: const Center(
          child: DeleteConfirmationButton(),
        ),
      ),
    );
  }
}

class DeleteConfirmationButton extends StatelessWidget {
  const DeleteConfirmationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showDeleteDialog(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: const Text('삭제 확인'),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900], // 다크 배경
          title: const Text(
            '정말 삭제하시겠습니까?',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            '이 작업은 되돌릴 수 없습니다.',
            style: TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () {
                print('삭제가 취소되었습니다.');
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent, // 버튼 텍스트 색상
              ),
              child: const Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                print('항목이 삭제되었습니다.');
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // 버튼 배경 색상
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
