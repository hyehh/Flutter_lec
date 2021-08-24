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
  late TextEditingController controller;
  String search = '알고리즘';
  late ScrollController scrollController;
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    controller = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(() {
      // 리스트의 마지막일 경우에 사용
      if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
        print('bottom');
        page++;
        print(page);
        getJSONData();
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: '검색하고 싶은 책을 입력해주세요!',
            ),
            keyboardType: TextInputType.text,
          ),
          actions: [
            IconButton(
              onPressed: (){
                  if(controller.text.isEmpty && controller.text == "") {
                  _showSnackBar(context);
                }else {
                  setState(() {
                    search = controller.text;
                    data.clear();
                    getJSONData();
                }); 
                }            
              }, 
              icon: Icon(Icons.search)
              )
          ],
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
                              data[index]['thumbnail'] == ''
                                  ? 'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F3401212%3Ftimestamp%3D20190220102153'
                                  : data[index]['thumbnail'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              data[index]['title'].toString().length > 18
                                  ? Text(
                                    data[index]['title']
                                    .toString()
                                    .replaceRange(18, data[index]['title'].toString().length, '...'),
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
              // 이거 있어야 이벤트 발생시킴! (리스너 작동가능하게 됨!)
              controller: scrollController,
              )
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            page = 1;
            data.clear();
            getJSONData();
          },
          child: Icon(Icons.file_download),
        ),
      ),
    );
  }

  Future<String> getJSONData() async{
    var url = Uri.parse(
      'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=$search'
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

void _showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("검색하고 싶은 책을 입력해주세요!"),
      backgroundColor: Colors.teal,
      )
  );
}