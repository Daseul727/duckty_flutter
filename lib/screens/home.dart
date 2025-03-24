import 'package:flutter/material.dart';
import 'package:duckty_flutter/screens/search.dart'; // 🔹 검색 화면 import

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 15),
          icon: Image.asset('assets/character.png'),
          onPressed: () {
            // 🔹 메뉴 버튼 클릭 시 동작
          },
        ),
        title: GestureDetector(
          onTap: () {
            // 🔹 검색 화면으로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 0.7),
            ),
            padding: EdgeInsets.only(left: 15, right: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('검색어를 입력하세요',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'NotoSansKR',
                        fontSize: 14,
                        fontWeight: FontWeight.w400)
                ),
                Image.asset(
                  'assets/ico-search.png',
                  width: 20,
                  height:20
                )
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('홈 화면'),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.star),
                Icon(Icons.confirmation_num_sharp),
                Icon(Icons.co2_outlined)]
          )
      )
    );
  }
}
