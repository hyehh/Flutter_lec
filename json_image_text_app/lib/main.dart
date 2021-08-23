import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String result = '';
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
    // var aaa = getJSONData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Movie"),
      ),
      body: Container(
        child: Center(
          child: data.length == 0 ?
          Text(
            '데이터가 없습니다.',
            style: TextStyle(
              fontSize: 20
            ),
            textAlign: TextAlign.center,
          )
          : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  child: Row(
                    children: [
                      Image.network(
                        data[index]['image'],
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        data[index]['title'],
                        style: TextStyle(
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: data.length,
            )
          ,
        ),
      ),
    );
  }

  Future<String> getJSONData() async{
  var url = Uri.parse('http://localhost:8080/flutter/movies.json');
  var response = await http.get(url);

  setState(() {
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data.addAll(result);
  });
  
  // return response.body 넣어줘도 가능!!
  return "a";
}

}