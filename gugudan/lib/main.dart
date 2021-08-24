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

  TextEditingController? controller;
  TextEditingController? resultcontroller;
  int num = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    resultcontroller = TextEditingController();
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        "구구단 출력",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: CupertinoTextField(
                            controller: controller,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                          ),
                          width: 100,
                        ),
                        CupertinoButton(
                          child: Text("단 출력"), 
                          onPressed: (){
                            if (controller!.text == "" || controller!.text.isEmpty) {
                              resultcontroller!.text = "숫자를 입력하세요!";
                            }else {
                              setState(() {
                                gugudan();
                              });
                            }
                            
                          }
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: CupertinoTextField(
                            controller: resultcontroller,
                            maxLines: 9,
                            textAlign: TextAlign.left,
                            decoration: BoxDecoration(
                              color: Colors.teal[50]
                            ),
                            readOnly: true,
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

  void gugudan() {
    resultcontroller!.text = "";
    for (int i=1; i<10; i++){
      resultcontroller!.text += "${controller!.text} X $i = ${int.parse(controller!.text) * i} \n";
    }
  }
}

// void _showSnackBar(BuildContext context) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text("숫자를 입력하세요!"),
//       backgroundColor: Colors.teal,
//     )
//   );
// }

