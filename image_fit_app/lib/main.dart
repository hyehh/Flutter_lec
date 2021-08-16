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
      appBar: AppBar(
        title: Text('image fit'),
        ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              // 50과 100d의 크기를 정확하게 꽉 채워서 맞춰버린 것임
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              // 그림의 비율에 맞춰서 가장 잘 보여주는 것(보통 contain을 많이 사용)
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              // 비율 유지하기 때문에 그림이 잘릴 수 있음
              fit: BoxFit.cover,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              // 폭 기준으로 맞추는 것
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              // 전체이미지가 나오도록 알아서 조절해서 맞춰줌 
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}