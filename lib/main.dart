import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR'
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Image.asset('assets/character.png'), onPressed: () {
              //아이콘 클릭 시 동작
            },
          ),
          title: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색어를 입력하세요', //힌트 텍스트
                filled: false, //배경색 활성화
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.search, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey, width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey, width: 1)
                ),
                contentPadding: EdgeInsets.only(left: 15, right: 10)
              ),
            ),
          ),
        ),
        body: Container(
          width: 150, height: 50, color: Colors.black,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
      )
    );

  }
}