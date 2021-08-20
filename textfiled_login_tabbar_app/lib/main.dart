import 'package:flutter/material.dart';
import 'package:textfiled_login_tabbar_app/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 특정 페이지로만 이동하기 때문에 굳이 로그인 페이지는 라우터 사용하지 않아도 됨!
      initialRoute: '/',
      routes: {
        '/' : (context) {
          return LoginPage();
        }
      },
    );
  }
}
