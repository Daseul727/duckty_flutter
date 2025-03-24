import 'package:flutter/material.dart';
import 'package:duckty_flutter/screens/search.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // AppBar의 기본 높이

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: 15),
        icon: Image.asset('assets/character.png'),
        onPressed: () {
          // 🔹 클릭 시 동작
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
              Text(
                '검색어를 입력하세요',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'NotoSansKR',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(
                'assets/ico-search.png',
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
