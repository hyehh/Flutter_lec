import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2nd.dart';


void main() {
  runApp(MyApp());
}

// main.dart 가 controller 역할
// 여기에서만 실행 가능!
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // 제일 처음 뜨는 화면 정의
      routes: {
        '/' : (context){
          return Screen();
        },
        '/1st' : (context){
          return Screen1st();
        },
        '/2nd' : (context){
          return Screen2nd();
        }
      },
    );
  }
}