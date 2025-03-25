import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  final PageController _controller2 = PageController(); // 두 번째 슬라이드를 위한 컨트롤러

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(// 전체 화면에 스크롤을 추가
        child: Column(
          children: [
            // 텍스트는 슬라이드보다 먼저 보이도록 위로 배치
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Text(
                  '어서오세요!', // 텍스트 내용
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // 첫 번째 슬라이드
            Container(
              height: 300, // 슬라이드 높이 설정
              child: PageView(
                controller: _controller,
                children: [
                  Container(
                    color: Colors.red,
                    child: Center(child: Text('슬라이드 1')),
                  ),
                  Container(
                    color: Colors.blue,
                    child: Center(child: Text('슬라이드 2')),
                  ),
                  Container(
                    color: Colors.green,
                    child: Center(child: Text('슬라이드 3')),
                  ),
                ],
              ),
            ),

            // 첫 번째 슬라이드 인디케이터
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: _controller, // 첫 번째 슬라이드의 PageController
                count: 3, // 첫 번째 슬라이드 개수
                effect: ExpandingDotsEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  activeDotColor: Colors.grey, // 활성화된 점의 색
                  dotColor: Colors.grey, // 비활성화된 점의 색
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Text(
                  '인기있는 행사', // 텍스트 내용
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // 두 번째 슬라이드
            Container(
              height: 200, // 두 번째 슬라이드 높이 설정
              child: PageView(
                controller: _controller2, // 두 번째 PageController
                children: [
                  Container(
                    color: Colors.purple,
                    child: Center(child: Text('두 번째 슬라이드 1')),
                  ),
                  Container(
                    color: Colors.orange,
                    child: Center(child: Text('두 번째 슬라이드 2')),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Center(child: Text('두 번째 슬라이드 3')),
                  ),
                ],
              ),
            ),

            // 두 번째 슬라이드 인디케이터
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: _controller2, // 두 번째 슬라이드의 PageController
                count: 3, // 두 번째 슬라이드 개수
                effect: ExpandingDotsEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  activeDotColor: Colors.grey, // 활성화된 점의 색
                  dotColor: Colors.grey, // 비활성화된 점의 색
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Text(
                  '다가오는 행사', // 텍스트 내용
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // 세 번째 슬라이드
            Container(
              height: 200, // 두 번째 슬라이드 높이 설정
              child: PageView(
                controller: _controller2, // 두 번째 PageController
                children: [
                  Container(
                    color: Colors.purple,
                    child: Center(child: Text('두 번째 슬라이드 1')),
                  ),
                  Container(
                    color: Colors.orange,
                    child: Center(child: Text('두 번째 슬라이드 2')),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Center(child: Text('두 번째 슬라이드 3')),
                  ),
                ],
              ),
            ),

            // 세 번째 슬라이드 인디케이터
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: _controller2, // 두 번째 슬라이드의 PageController
                count: 3, // 두 번째 슬라이드 개수
                effect: ExpandingDotsEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  activeDotColor: Colors.grey, // 활성화된 점의 색
                  dotColor: Colors.grey, // 비활성화된 점의 색
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
