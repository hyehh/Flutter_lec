import 'package:flutter/material.dart';
import 'package:textfiled_login_tabbar_app/firstPage.dart';
import 'package:textfiled_login_tabbar_app/secondPage.dart';
import 'package:textfiled_login_tabbar_app/animalItem.dart';

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

class _MyHomePageState extends State<MyHomePage> 
with SingleTickerProviderStateMixin { // tabbar 를 위해 with 이하 작성해야 함!

  late TabController controller;
  List<Animal> animalList = [];

  @override
  void initState() { // build 하기 전에 실행되는 것!
    // TODO: implement initState
    super.initState();
    // length는 탭 개수
    // vsync 로 첫 번째 페이지와 두 번째 페이지에 탭바를 집어 넣음!
    controller =  TabController(length: 2, vsync: this);
    animalList.add(Animal(
      animalName: '벌', 
      kind: '곤충', 
      imagePath: 'images/bee.png', 
      flyExist: true)
      );
      animalList.add(Animal(
      animalName: '고양이', 
      kind: '포유류', 
      imagePath: 'images/cat.png', 
      flyExist: false)
      );
      animalList.add(Animal(
      animalName: '젖소', 
      kind: '포유류', 
      imagePath: 'images/cow.png', 
      flyExist: false)
      );
      animalList.add(Animal(
      animalName: '강아지', 
      kind: '포유류', 
      imagePath: 'images/dog.png', 
      flyExist: false)
      );
      animalList.add(Animal(
      animalName: '여우', 
      kind: '포유류', 
      imagePath: 'images/fox.png', 
      flyExist: false)
      );
      animalList.add(Animal(
      animalName: '원숭이', 
      kind: '영장류', 
      imagePath: 'images/monkey.png', 
      flyExist: false)
      );
      animalList.add(Animal(
      animalName: '돼지', 
      kind: '포유류', 
      imagePath: 'images/pig.png', 
      flyExist: false)
      );
      animalList.add(Animal(
      animalName: '늑대', 
      kind: '포유류', 
      imagePath: 'images/wolf.png', 
      flyExist: false)
      );
      
  }

  @override
  void dispose() { // app 종료 시!
    // TODO: implement dispose
    // super.dispose(); 위에 작성할 것!
    controller.dispose(); // 이거 안하면 핸드폰에 계속 쓰레기가 쌓임!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Test"),
      ),
      body: TabBarView( // 여기에 TabBarView가 들어감!
        children: [
          // 여기에서 데이터를 보내주면 되는 것임! 생성자를 통해 보내는 것!
          FirstPage(
            // key값: value 값
            list: animalList,
          ), 
          SecondPage(
            list: animalList,
          )
        ],
        // 이거 꼭 해줘야 함!!
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        // tabbar는 기본적으로 하얀색이기 때문에 글씨 보여주고 싶으면 색 지정해줘야 함!
        labelColor: Colors.blueAccent,
        tabs: [
          // tab에 대한 디자인!
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
            text: 'Page #1',
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
            text: 'Page #2',
          ),
        ],
        // 이거 꼭 해줘야 함!!
        controller: controller,
        ),
    );
  }
}