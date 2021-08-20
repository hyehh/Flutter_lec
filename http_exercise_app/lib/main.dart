import 'package:flutter/material.dart';
// 'package:http/http.dart' 를 http라는 변수로 바꾸는 것!
import 'package:http/http.dart' as http;

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Exercise"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // container는 child 하나 밖에 안쓴다!
          child: Center(
            child: Text('$result'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var url = Uri.parse('https://www.google.com');
          // response 에 정보가 있을 것임!
          var response = await http.get(url);
          setState(() {
            result = response.body;
          });
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
}