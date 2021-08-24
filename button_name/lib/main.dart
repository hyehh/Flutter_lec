import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // TextEditingController
  // 언어의 값을 주냐 플루터 라이프사이클에 값을 주냐의 차이인데 플루터 라이프사이클에 값을 주는 게 좋음!

  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String str = "Welcome!";

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(str),
                SizedBox(
                  height: 100,
                ),
                CupertinoButton(
                  child: Text("Name"), 
                  onPressed: (){
                    setState(() {
                      if (str == "Welcome!") {
                        str = "Welcome! Hyeji";
                      }else {
                        str = "Welcome!";
                      }
                    });
                  }
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}