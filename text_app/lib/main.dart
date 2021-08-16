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
      // debug 모드 없애기
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold에는 AppBar와 Body 
      appBar: AppBar(
        title: Text("Text App"),
        backgroundColor: Colors.blue,
        ),
      body: Center(
        child: Column(
          // 정중앙에 오게 하기
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ // 데이터 여러 개 둘 수 있음
            Text("유비"),
            SizedBox(
              // 50px 만큼 떨어짐
              height: 50.0,
              ),
            Text("장비"),
            Text("관우"),
          ],
        ),
      ),
    );
  }
}