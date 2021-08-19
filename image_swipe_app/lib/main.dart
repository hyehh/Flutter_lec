import 'package:flutter/material.dart';
// 아이콘 확인하고 폴더가 아닌 dart모양 선택하기!
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // app 등록 시 app information 임! app 등록 시 바꿔줄 것!
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

  List<String> imageName = [
    "flower_01.png", 
    "flower_02.png", 
    "flower_03.png", 
    "flower_04.png", 
    "flower_05.png", 
    "flower_06.png"
    ];
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Image Swiping"),
      ),
      body: Center(
        child: SimpleGestureDetector(
          // onVertical은 상하로 움직이는 것!
          onHorizontalSwipe: _onHorizontalSwipe,
          onVerticalSwipe: _onHorizontalSwipe,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(imageName[currentImage],
                style: TextStyle(
                  fontSize: 20.0
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/${imageName[currentImage]}',
                  width: 350.0,
                  height: 600.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if(direction == SwipeDirection.left) {
        print("Left");
        currentImage += 1;
        print(currentImage);
        if(currentImage >= imageName.length) {
          currentImage = 0;
          }
        }else {
          print("Right");
          currentImage -= 1;
          print(currentImage);
          if(currentImage < 0) {
            currentImage = imageName.length -1;
          }
        }
    });
  }

}