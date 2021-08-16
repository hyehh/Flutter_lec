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
      debugShowCheckedModeBanner: false,
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
        title: Text('Text Exercise 01'),
        backgroundColor: Colors.lightGreen,
        // appbar 좌측 정렬
        centerTitle: false,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,           
          children: [
            Divider( // 줄치기
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5,
            ),
            Text("유비"),
            Text("관우"),
            Text("장비"),
            // SizedBox(
            //   height: 50.0,
            // ),
            Divider( // 줄치기
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5,
            ),
            // 글자 색 바꾸기 & 글자 간격 조정하기
            Text("조조", 
            style: TextStyle(
              color: Colors.blue, 
              letterSpacing: 5.0,
              fontSize:  28.0,
              fontWeight: FontWeight.bold,
              )),
            Text("여포"),
            Text("동탁"),
            Divider( // 줄치기
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}