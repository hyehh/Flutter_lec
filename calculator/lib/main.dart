import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController addController;
  late TextEditingController minusController;
  late TextEditingController mulController;
  late TextEditingController divController;
  String str = "환영합니다!";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    addController = TextEditingController();
    minusController = TextEditingController();
    mulController = TextEditingController();
    divController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: CupertinoApp(
        home: CupertinoPageScaffold(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            "두 개의 숫자연산",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("첫 번째 숫자 :"),
                              width: 100,
                            ),
                            Container(
                              child: CupertinoTextField(
                                controller: num1Controller,
                                keyboardType: TextInputType.number,
                                placeholder: "숫자를 입력하세요!",
                                maxLines: 1,
                                textAlign: TextAlign.right,
                              ),
                              width: 150,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("두 번째 숫자 :"),
                              width: 100,
                            ),
                            Container(
                              child: CupertinoTextField(
                                controller: num2Controller,
                                keyboardType: TextInputType.number,
                                placeholder: "숫자를 입력하세요!",
                                maxLines: 1,
                                textAlign: TextAlign.right,
                              ),
                              width: 150,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CupertinoButton(
                          child: Text("계산하기"), 
                          onPressed: (){
                            if (num1Controller.text == "" || num1Controller.text.isEmpty || num2Controller.text == "" || num2Controller.text.isEmpty) {
                              setState(() {
                                str = "숫자를 입력하세요!";
                                addController.text = "";
                                minusController.text = "";
                                mulController.text = "";
                                divController.text = "";
                              });
                            }else {
                              addController.text = (int.parse(num1Controller.text)+int.parse(num2Controller.text)).toString();
                              minusController.text = (int.parse(num1Controller.text)-int.parse(num2Controller.text)).toString();
                              mulController.text = (int.parse(num1Controller.text)*int.parse(num2Controller.text)).toString();
                              divController.text = (double.parse(num1Controller.text)/double.parse(num2Controller.text)).toString();
                              str = "계산이 완료되었습니다!";
                            }
                          }
                         ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("덧셈 결과 :"),
                              width: 100,
                            ),
                            Container(
                              child: CupertinoTextField(
                                controller: addController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                readOnly: true,
                              ),
                              width: 150,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("뺄셈 결과 :"),
                              width: 100,
                            ),
                            Container(
                              child: CupertinoTextField(
                                controller: minusController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                readOnly: true,
                              ),
                              width: 150,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("곱셈 결과 :"),
                              width: 100,
                            ),
                            Container(
                              child: CupertinoTextField(
                                controller: mulController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                readOnly: true,
                              ),
                              width: 150,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("나눗셈 결과 :"),
                              width: 100,
                            ),
                            Container(
                              child: CupertinoTextField(
                                controller: divController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                textAlign: TextAlign.right,
                                readOnly: true,
                              ),
                              width: 150,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          str,
                          style: TextStyle(
                            color: Colors.red
                          ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}