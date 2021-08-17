import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        title: Text("Snack Bar"),
      ),
      body: MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        // flutter 에서는 데이터 주고 받을 때 message 라고 표현
        ScaffoldMessenger.of(context).showSnackBar(
          // snackbar 내용 보여주기
          SnackBar(content: Text("Elevated Button"),
          // 1초 동안 띄어주기
          duration: Duration(seconds: 1),
          // background color 바꿔주기 (기본 검정)
          backgroundColor: Colors.red,
          ),
        ); // 함수이기에 ; 적어줘야 함
      }, 
      child: Text(
        "SnackBar Button"
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      ),
    );
  }
}