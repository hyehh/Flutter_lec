import 'package:flutter/material.dart';

class CalcSecond extends StatefulWidget {
  const CalcSecond({ Key? key }) : super(key: key);

  @override
  _CalcSecondState createState() => _CalcSecondState();
}

class _CalcSecondState extends State<CalcSecond> {

  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  int num1 = 0;
  int num2 = 0;
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text("$resultText",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25.0
                  ),
                ),
                TextField(
                  controller: num1Controller,
                  decoration: InputDecoration(
                    labelText: "첫 번째 숫자를 입력하세요!",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: num2Controller,
                  decoration: InputDecoration(
                    labelText: "두 번째 숫자를 입력하세요!",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if (num1Controller.text == "" || num1Controller.text.isEmpty || num2Controller.text == "" || num2Controller.text.isEmpty){
                        showSnackBar(context);
                        resultText = "";
                      }else {
                        num1 = int.parse(num1Controller.text);
                        num2 = int.parse(num2Controller.text);
                        resultText = "덧셈 결과 : ${num1 + num2}";
                      }
                    });
                  }, 
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text("덧셈 계산"),
                    ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("숫자를 입력해주세요!"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.teal,
    )
  );
}