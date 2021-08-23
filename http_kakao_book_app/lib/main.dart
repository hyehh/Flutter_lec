import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Http Exercise"
        ),
      ),
      body: GestureDetector(
        child: Container(
          child: Center(
            child: data.length == 0 ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '데이터가 없습니다',
                  style: TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
           : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  child: Row(
                    children: [
                      Image.network(
                        data[index]['thumbnail'],
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            data[index]['title'].toString().length > 15
                                ? Text(
                                  data[index]['title']
                                  .toString()
                                  .replaceRange(20, data[index]['title'].toString().length, '...'),
                                style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                                )
                                : Text(data[index]['title'],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                                ),
                          Text(
                            data[index]['authors'][0],
                            style: TextStyle(
                              fontSize: 13
                            ),
                          ),
                          Text(
                            data[index]['sale_price'].toString(),
                            style: TextStyle(
                              fontSize: 13
                            ),
                          ),
                          Text(
                            data[index]['status'],
                            style: TextStyle(
                              fontSize: 13
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: data.length,
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          data.clear();
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async{
    var url = Uri.parse(
      'https://dapi.kakao.com/v3/search/book?target=title&query=알고리즘'
    );
    var response = await http.get(url, 
      headers: {"Authorization" : "KakaoAK 695a3e20a2d8813852c79808d6da4664"}
    );
    print(response.body);

  setState(() {
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['documents'];
    data.addAll(result);
  });

    return "Success";
  }
}