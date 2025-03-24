import 'package:flutter/material.dart';
import 'package:duckty_flutter/screens/home.dart';
import 'package:flutter/services.dart'; // 🔹 홈 화면 import

void main() {
  // 상태 바 배경 색상 변경 (흰색으로 설정)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // 상태 바 색상을 흰색으로 설정
    statusBarIconBrightness: Brightness.dark, // 상태 바 아이콘을 어두운 색으로 설정 (흰색 배경에 어울리도록)
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      home: HomeScreen(), // 🔹 HomeScreen이 앱의 첫 화면이 됨
    );
  }
}
