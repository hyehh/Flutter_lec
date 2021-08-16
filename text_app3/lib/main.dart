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
        title: Text('Text Row'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row( // Row 는 옆으로 쭉
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('James'),
            SizedBox(
              width: 20,
            ),
            Text('Cathy'),
            SizedBox(
              width: 20,
            ),
            Text('Kenny'),
          ],
        ),
      ),
    );
  }
}