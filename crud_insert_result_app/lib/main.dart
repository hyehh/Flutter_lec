import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  late String result;
  final codeController = TextEditingController();
  final nameController = TextEditingController();
  final deptController = TextEditingController();
  final phoneController = TextEditingController();
  late String code;
  late String name;
  late String dept;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Insert & return for CRUD"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                      labelText: "학번을 입력하세요!"
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "성명을 입력하세요!"
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: deptController,
                    decoration: InputDecoration(
                      labelText: "전공을 입력하세요!"
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "전화번호를 입력하세요!",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (codeController.text == "" || codeController.text.isEmpty ||
                          nameController.text == "" || nameController.text.isEmpty ||
                          deptController.text == "" || deptController.text.isEmpty ||
                          phoneController.text == "" || phoneController.text.isEmpty
                      ){
                        _showSnackBar(context);
                      }else {
                        setState(() {
                          code = codeController.text;
                          name = nameController.text;
                          dept = deptController.text;
                          phone = phoneController.text;
                          
                          getJSONData();
                        });
                      }
                    }, 
                    child: Text("입력")
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

Future<String> getJSONData() async{
  var url = Uri.parse('http://localhost:8080/flutter/student_insert_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
  print(url);
  var response = await http.get(url);

  setState(() {
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];
  });
  
  print(result);
  if (result == "OK") {
    _showAlert(context);
  }else {
    _showSnackBar(context);
  }
  return "a";
}

}

void _showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("사용자 정보 입력에 문제가 발생하였습니다!"),
      backgroundColor: Colors.redAccent,
      )
  );
}

void _showAlert(BuildContext context) {
  showDialog(
    context: context, 
    // builder : alertDialog를 만드는 것!
    builder: (BuildContext context){
      // 위에 build 함수와 동일하게 만들어주면 됨!
      return AlertDialog(
        title: Text("입력 결과"),
        content: Text('입력이 완료되었습니다!'),
        actions: [
          // alert에 버튼 사용하고 싶은 경우 actions 사용해서 만들어주기
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: (){
              // alert 화면을 없애버리는 것!
              Navigator.of(context).pop();
            }, 
            child: Text("OK"),
            ),
        ],
        );
    },
    );
}