import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:tabbar_circle_app/firstPage.dart';
import 'package:tabbar_circle_app/secondPage.dart';

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
with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("피카츄 이미지 탭바"),
      ),
      body: TabBarView(
        children: [
            FirstPage(), SecondPage()
          ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blue,
        tabs: [
          Tab(
            icon: Icon(
              Icons.lock_clock_outlined,
              color: Colors.blue,
            ),
            text: 'Pickachu Scene #1',
          ),
          Tab(
            icon: Icon(
              Icons.verified_user,
              color: Colors.pink,
            ),
            text: 'Pickachu Scene #2',
          ),
        ],
        controller: controller,
        ),
    );
  }
}