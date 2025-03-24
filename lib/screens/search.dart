import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> allItems = ['사과', '바나나', '포도', '오렌지', '키위', '복숭아'];
  List<String> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = allItems;
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchResults = allItems
          .where((item) => item.contains(query))
          .toList();
    });
  }

  void _onSearchIconPressed() {
    String query = _searchController.text;
    if (query.isNotEmpty) {
      _onSearchChanged(query);
    }
    /*showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('디버깅'),
          content: Text('검색어: $query'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/ico-back.png',
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Navigator.pop(context); //뒤로가기 이전화면
          },
        ),
        title: SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'NotoSansKR',
                fontSize: 14,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요',
              hintStyle: TextStyle(color: Colors.grey),
              filled: false,
              fillColor: Colors.white,
              suffixIcon: GestureDetector(
                onTap: _onSearchIconPressed,  // 클릭 시 검색
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),  // 위아래 패딩
                  child: Image.asset(
                    'assets/ico-search.png',
                    width: 10,
                    height: 10,
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey, width: 0.7)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey, width: 0.7)
              ),
              contentPadding: EdgeInsets.only(left: 15, right: 5),  // 내용 패딩 조정
            ),
            onChanged: _onSearchChanged,  // 텍스트 변경 시 바로 검색
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index]),
          );
        },
      ),
    );
  }
}
