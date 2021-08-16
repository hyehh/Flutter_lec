import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body의 배경색 바꾸기
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Image Test'),
      ),
      body: Center(
        child: Image.asset(
          'images/smile.png',
          // 이미지 크기 조절
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}