import 'package:duckty_flutter/widgets/header.dart';
import 'package:duckty_flutter/screens/home.dart';
import 'package:duckty_flutter/screens/mypage.dart';
import 'package:duckty_flutter/screens/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 상태 바 색상 변경을 위해 필요
import 'package:intl/date_symbol_data_local.dart'; // 한글 날짜 형식 추가

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화
  await initializeDateFormatting('ko_KR', null); // 날짜 형식 한글 설정

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
      locale: const Locale('ko', 'KR'), // 앱 기본 로케일 설정
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      home: MainScreen(), // MainScreen이 앱의 첫 화면이 됨
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CalendarScreen(),
    MyPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '달력',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}