import 'package:drawer_exercise_app/firstPage.dart';
import 'package:drawer_exercise_app/receivedPage.dart';
import 'package:drawer_exercise_app/sendPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) {
          return FirstPage();
        },
        '/sendPage' : (context) {
          return SendPage();
        },
        '/receivedPage' : (context) {
          return ReceivedPage();
        },
      },
    );
  }
}
