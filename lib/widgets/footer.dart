import 'package:duckty_flutter/screens/home.dart';
import 'package:duckty_flutter/screens/mypage.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '마이페이지',
        ),
      ],
      onTap: (index) {
        if (index == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPageScreen())
          );
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen())
          );
        }
      },
    );
  }
}
