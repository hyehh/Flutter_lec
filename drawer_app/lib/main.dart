import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        // 안드로이드에서도 앱바 타이틀 center로 위치하고 싶은 경우 true
        // ios에서 앱바 타이틀 왼쪽으로 위치하고 싶은 경우 false
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              print("Shopping cart is clicked!");
            }, 
            icon: Icon(Icons.shopping_cart),
            ),
          IconButton(
            onPressed: (){
              print("Search is clicked!");
            }, 
            icon: Icon(Icons.search),
            ),
        ],
      ),
      // appbar도 아니고 body도 아닌 drawer!
      drawer: Drawer( // 이것만 해줘도 빈화면 나오고 햄버거 버튼 생김
        child: ListView( // ListView : 밑으로 차곡차곡 쌓이는 것! (Column 써도 상관은 없음)
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/p1.png',
                  ),
                  backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                backgroundImage: AssetImage(
                  'images/p2.png',
                  ),
                  backgroundColor: Colors.white,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  'images/p3.png',
                  ),
                  backgroundColor: Colors.white,
              ),
              ],
              accountName: Text("Pickachu"), 
              accountEmail: Text("pickachu@naver.com"),
              // accountName, accountEmail 눌렀을 때 이벤트
              onDetailsPressed: (){
                print("Main page is clicked!");
              },
              // 박스 모양 디자인
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )
              ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home, 
                  color: Colors.teal,
                  ),
                  title: Text('Home'),
                  // 눌렀을 때 동작 주기
                  onTap: (){
                    print("Home is clicked!");
                  },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings, 
                  color: Colors.teal,
                  ),
                  title: Text('설정'),
                  // 눌렀을 때 동작 주기
                  onTap: (){
                    print("Setting is clicked!");
                  },
              ),
              ListTile(
                leading: Icon(
                  Icons.question_answer, 
                  color: Colors.pink,
                  ),
                  title: Text('자주 묻는 질문'),
                  // 눌렀을 때 동작 주기
                  onTap: (){
                    print("Question_answer is clicked!");
                  },
              )
          ],
        ),
      ),
    );
  }
}