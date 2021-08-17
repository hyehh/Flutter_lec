import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // column 위젯은 children 사용이 가능하므로 자식을 여러 명 둘 수 있다!

            TextButton( // onPressed는 눌렀을 때 뭐 할 것인지 function, child 는 버튼 텍스트
              onPressed: (){
                print("Text Button Click!");
              }, 
              onLongPress: (){
                print("Text Button Long Click");
              },
              child: Text(
                "Text Button",
                style: TextStyle( // text 스타일
                  fontSize: 20.0,
                ),
                ),
                style: TextButton.styleFrom( // textbutton 스타일
                  primary: Colors.red,
                ),
              ),
              
              ElevatedButton(
                onPressed: (){
                  print("Elevated Button");
              },
              child: Text(
                "Elevated Button"
                ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
              ),

              OutlinedButton(
                onPressed: (){
                  print("OutLined Button");

              }, child: Text(
                "OutLined Button"
                ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.green,
                    side: BorderSide(
                      color: Colors.black87,
                      width: 2.0
                      )
                  ),
              ),

             TextButton.icon(onPressed: (){
                print("Icon Button");
               }, 
             icon: Icon(
               Icons.home,
               size: 30.0,
               ), 
               label: Text('Go home'),
               style: TextButton.styleFrom(
                 primary: Colors.purple,
               ),
               ),

            ElevatedButton.icon(onPressed: (){
                print("Elevated Icon");
              }, 
             icon: Icon(
               Icons.home,
               size: 20.0,
               ), 
               label: Text('Go home'),
               style: ElevatedButton.styleFrom(
                 primary: Colors.teal,
               ),
               ),

            OutlinedButton.icon(
              onPressed: (){
                print("Outlined icon");
              }, 
              icon: Icon(
                Icons.home,
                size: 20.0,
              ), 
              label: Text(
                'Go home'
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.teal
                ),
              ),

            ElevatedButton.icon(onPressed: (){
                print("Elevated Icon");
              }, 
             icon: Icon(
               Icons.home,
               size: 20.0,
               ), 
               label: Text('Go home'),
               style: ElevatedButton.styleFrom(
                 primary: Colors.pink[100],
                 // onSurface: Colors.pink,
               ),
               ),

               ButtonBar(
                 // 기본적으로 row 포맷이라고 생각
                 alignment: MainAxisAlignment.center,
                 buttonPadding: EdgeInsets.all(20),
                 children: [
                   TextButton(onPressed: (){
                    print("Text Button");
                   }, 
                   child: Text("Text Button"),
                   ),

                   ElevatedButton(onPressed: () {
                     print("Elevated Button");
                   },
                  child: Text("Elevated Button"),
                   )
                 ],
               )
          ],
        ),
      ),
    );
  }
}