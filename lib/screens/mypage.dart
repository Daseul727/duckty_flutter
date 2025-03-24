import 'package:flutter/material.dart';
import 'package:duckty_flutter/widgets/footer.dart'; // Footer 위젯 import
import 'package:duckty_flutter/widgets/header.dart'; // Header 위젯 import

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(), // Header 위젯 사용
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('내 정보', style: TextStyle(fontSize: 16)),
              onTap: () {
                // 내 정보 클릭 시 동작
              },
            ),
            ListTile(
              title: Text('로그아웃', style: TextStyle(fontSize: 16)),
              onTap: () {
                // 로그아웃 클릭 시 동작
              },
            ),
            ListTile(
              title: Text('개인정보 방침', style: TextStyle(fontSize: 16)),
              onTap: () {
                // 개인정보 방침 클릭 시 동작
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(), // Footer 위젯 사용
    );
  }
}
