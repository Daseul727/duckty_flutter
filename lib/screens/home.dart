import 'package:duckty_flutter/widgets/footer.dart';
import 'package:duckty_flutter/widgets/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Text('홈 화면'),
      ),
      bottomNavigationBar: Footer()
    );
  }
}
