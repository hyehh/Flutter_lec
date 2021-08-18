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

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 선언 시 값이 있어야 함!
  // 값이 없으려면 String? buttonText; 로 하면 되긴 하나 값 주는 게 속 편함!
  String buttonText = "Hello";
  // _변수명 : 변수이름 앞에 _ 들어가면 private 임!
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change button color & text"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_color),
              ),
              onPressed: (){
                if (_color == Colors.blue) {
                  setState(() { // setState 에 적을 변수들은 전역변수로 세팅해놓는 게 좋음!
                    buttonText = "Flutter";
                    _color = Colors.amber;
                  });
                }else {
                  setState(() {
                    buttonText = "Hello";
                  _color = Colors.blue;
                  });
                }
              }, 
              child: Text('$buttonText'),
              ),
          ],
        ),
      )
    );
  }
}