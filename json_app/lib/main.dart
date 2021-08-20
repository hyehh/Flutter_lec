import 'package:flutter/material.dart';
// phh 라고 치면 쉽게 찾을 수 있음
import 'package:http/http.dart' as http;
// 이게 json 쓰는 것!
import 'dart:convert'; // for json

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
  // 결과값 받는 변수
  String result = '';
  // json 담기 위해 list가 필요함!
  late List data; // null safety로 인해 late를 주든가 옵셔널을 주든가 해야함!

  @override
  void initState() { // 화면 뜨기 전!
    // TODO: implement initState
    super.initState();
    // 비어 있는 list 선언
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          // container 사용 시 어떤 핸드폰이든 꽉채워줌!
          child: Center(
            // widget 꾸밀 때 if문이나 for문 사용 못하지만 삼항 연산자는 사용이 가능함!
            child: data.length == 0
              ? Text(
                '데이터가 없습니다.', 
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )
              : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Code :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Text(data[index]['code'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Name :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Text(data[index]['name'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Dept :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Text(data[index]['dept'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Phone :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              Text(data[index]['phone'].toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: data.length,
                ),
          ),
        ),
      ),
    );
  }

  // 같은 class 안에 쓰는 이유? setState 사용하기 위해!
  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/flutter/student.json');
    var response = await http.get(url);
    // print(response.body);
    setState(() {
      // decode하게 되면 json 파일에서 {[]} 이런 기호들 다 없애주고 key와 value 값만 남음
      var dataConvertedJSON = json.decode(response.body);
      // results -> json 에서 데이터 이름!
      List result = dataConvertedJSON['results'];
      // 전체적으로 0번 전체적으로 1번
      // print(result);
      // 한 번에 데이터 다 집어넣어주는 것!!!
      data.addAll(result);

    });

    return "a";
  }
}