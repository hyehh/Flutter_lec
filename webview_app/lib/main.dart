import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
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

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool isLoading = true; // for Indicator
  final siteController = TextEditingController();
  String url = "https://www.daum.net";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: TextField(
            controller: siteController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.deepOrange
            ),
             decoration: InputDecoration(
               hintText: "Site 이름을 입력하세요!",
             ),
          ),
          actions: [
            IconButton(
              onPressed: (){
                if(siteController.text.isEmpty && siteController.text == "") {
                  _showSnackBar(context);
                }else {
                  setState(() {
                    url = siteController.text;
                    _controller.future.then((value) => value.loadUrl(url));
                });
                }
              }, 
              icon: Icon(Icons.query_stats)
              ),
            // GestureDetector(
            //   onTap: (){
            //     setState(() {
            //       if(siteController.text.isEmpty && siteController.text == "") {
    
            //       } else {
            //         url = siteController.text;
            //       }
            //     });
            //   },
            //   child: Icon(Icons.search)
            //   )
          ],
        ),
        body: Stack(
          // Stack 은 위젯을 계속 쌓을 수 있는 것!
          // WebView위에 Indicator를 쌓기 위해 Stack 위젯 사용
          children: [
            // z축으로 계속 쌓임
            WebView(
              initialUrl: url,
              // 자바 스크립트 수용하겠다는 의미
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              // 페이지 다 불러온 경우
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              onPageStarted: (start) {
                setState(() {
                  isLoading = true;
                });
              },
            ),
            // 삼항 연산자 사용!
            isLoading ? Center(
              // isLoading true이면!
              child: CircularProgressIndicator(),
            )
            // isLoading false이면!
            : Stack(),
          ],
        ),
        floatingActionButton: FutureBuilder<WebViewController> (
          // 현재 페이지를 저장해서 미래에서 클릭하면 현재페이지로 돌아오는 것!
          // 1페이지를 저장해서 2페이지에서 1페이지로 돌아오는 것!
          // 프로그램이 다 구동 된 후에 future가 구동됨! (가장 마지막에 구동됨)
          future: _controller.future,
          builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
            // 현재 메모리 상태를 그대로 저장해놓는게 asyncsnapshot!
            // 데이터 들어왔는지 물어보는 것!
            if(controller.hasData) {
              return FloatingActionButton(
                child: Icon(Icons.arrow_back),
                backgroundColor: Colors.redAccent,
                onPressed: () {
                  controller.data!.goBack();
                }
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Site 이름을 입력해주세요!"),
      backgroundColor: Colors.teal,
      )
  );
}