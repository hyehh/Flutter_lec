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
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? multilines;
  TextEditingController? singleline;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    multilines = TextEditingController();
    singleline = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  '여러 줄 출력',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CupertinoTextField(
                      controller: singleline,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      placeholder: '글자를 입력하세요!',
                    ),
                    width: 280,
                  ),
                  CupertinoButton(
                    child: Text("추가"), 
                    onPressed: (){
                      setState(() {
                        insertLines();
                      });
                    }
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CupertinoTextField(
                  controller: multilines,
                  // 10줄 넘으면 스크롤해야지 내용이 보임!
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  void insertLines() {
    // 여기에서 setState를 줘도 되고, 함수 불러올 때 setState를 줘도 되고 이건 본인 선택!
    multilines!.text += singleline!.text + "\n";
  }

}