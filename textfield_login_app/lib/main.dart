import 'package:flutter/material.dart';
import 'package:textfield_login_app/confirmPage.dart';
import 'package:textfield_login_app/firstPage.dart';
import 'package:textfield_login_app/info.dart';

void main() {
  runApp(MyApp());
}

// main.dart 가 controller 역할
// 여기에서만 실행 가능!
class MyApp extends StatelessWidget {

  // List<Info> infoList = [];
  String id = "hyehh";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // 제일 처음 뜨는 화면 정의
      routes: {
        '/' : (context){
          return FirstPage(
            // list: infoList,
          );
        },
        '/confirm' : (context){
          return ConfirmPage(
            id: id,
          );
        },
      },
    );
  }
}