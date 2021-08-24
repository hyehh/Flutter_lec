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
      debugShowCheckedModeBanner: false,
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

  TextEditingController? _productName;
  TextEditingController? _productSize;
  TextEditingController? _productWeight;
  TextEditingController? _productBag;
  TextEditingController? _productColor;

  String productName = "맥북프로";
  int productSize = 16;
  double proudctWeight = 2.56;
  bool productBag = false;
  String productColor = "yellow";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productName = TextEditingController();
    _productSize = TextEditingController();
    _productWeight = TextEditingController();
    _productBag = TextEditingController();
    _productColor = TextEditingController(); 
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            // 이거 안하면 노치에 숨어버려서 텍스트 안보임!
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Text(
                  'Computer 사양',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // container 안에 container
                            child: Text("제품명 :"),
                            // container의 장점 : 크기를 줄 수 있다!
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _productName,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              // hint!
                              placeholder: '제품명',
                              readOnly: true,
                            ),
                            width: 150,
                          ),
                        ],  
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // container 안에 container
                            child: Text("화면 크기 :"),
                            // container의 장점 : 크기를 줄 수 있다!
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _productSize,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              // hint!
                              placeholder: '화면 크기',
                              readOnly: true,
                            ),
                            width: 150,
                          ),
                        ],  
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // container 안에 container
                            child: Text("무게 :"),
                            // container의 장점 : 크기를 줄 수 있다!
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _productWeight,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              // hint!
                              placeholder: '무게',
                              readOnly: true,
                            ),
                            width: 150,
                          ),
                        ],  
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // container 안에 container
                            child: Text("가방 :"),
                            // container의 장점 : 크기를 줄 수 있다!
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _productBag,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              // hint!
                              placeholder: '가방',
                              readOnly: true,
                            ),
                            width: 150,
                          ),
                        ],  
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // container 안에 container
                            child: Text("색상 :"),
                            // container의 장점 : 크기를 줄 수 있다!
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _productColor,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              // hint!
                              placeholder: '색상',
                              readOnly: true,
                            ),
                            width: 150,
                          ),
                        ],  
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                child: Text('OK'), 
                onPressed: (){
                  _productName!.text = productName;
                  _productSize!.text = productSize.toString();
                  _productWeight!.text = proudctWeight.toString();
                  _productBag!.text = productBag.toString();
                  _productColor!.text = productColor;
                }
                ),
              CupertinoButton(
                child: Text('Clear'), 
                onPressed: (){
                  _productName!.text = "";
                  _productSize!.text = "";
                  _productWeight!.text = "";
                  _productBag!.text = "";
                  _productColor!.text = "";
                }
                ),
            ],
          ),
        ),
      ),
    );
  }
}