import 'package:date_picker/zeroFormat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
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

  String currentDateTime = "";
  bool _isRunning = true;
  ZeroFormat zero = ZeroFormat();
  DateTime? chosenDateTime;

  @override
  void initState() { // 이 부분이 변경되었다면 reload하고 사용하기!
    // TODO: implement initState
    super.initState();
    // 앱 뜨기 전에 타이머 구동시키기
    Timer.periodic(Duration(seconds: 1), (Timer timer) { 
      if (!_isRunning) {
        // 동작하지 않는다면
        timer.cancel();
      }
      // 그렇지 않다면 계속 구동
      _addItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
        const Locale('en', 'US'),
      ],
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("현재 시간 : " + currentDateTime,
              style: TextStyle(
                fontSize: 16.0
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: CupertinoDatePicker(
                    // 초기값 설정
                    initialDateTime: DateTime.now(),
                    use24hFormat: true,
                    onDateTimeChanged: (value) {
                      chosenDateTime = value;
                    }
                    ),
                    width: 300,
                    height: 200,
                ),
              ),
              Text(
                '선택시간 : ${chosenDateTime != null ? _chosenItem(chosenDateTime!) : "시간을 선택하세요"}',
                style: TextStyle(
                  fontSize: 16.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addItem() {
    // now에는 현재 시간이 들어가있음!
    final DateTime now = DateTime.now();
    setState(() {
      // 1초마다 계속 값 부여될 것!
      // 이렇게만 적으면 자릿수가 안맞는다!
      currentDateTime = ("${now.year}-${zero.monthZero(now.month)}-${zero.dayZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.hourZero(now.hour)}:${zero.minuteZero(now.minute)}:${zero.secondZero(now.second)}");
    });
  }

  String _weekdayToString(int weekday) { // 요일 포맷 바꾸기
    String dateName = "";
    switch(weekday) {
      case 1:
        dateName = "월";
        break;
      case 2:
        dateName = "화";
        break;
      case 3:
        dateName = "수";
        break;
      case 4:
        dateName = "목";
        break;
      case 5:
        dateName = "금";
        break;
      case 6:
        dateName = "토";
        break;
      case 7:
        dateName = "일";
        break;
    }
    return dateName;
  }

  String _chosenItem(DateTime now) { // now라고 쓴 이유? 밑에 다 now로 잡아줬기에 변수 바꾸기 귀찮아서!
    // now에는 현재 시간이 들어가있음!
    String chosenDateTime = "";
    setState(() {
      // 1초마다 계속 값 부여될 것!
      // 이렇게만 적으면 자릿수가 안맞는다!
      chosenDateTime = ("${now.year}-${zero.monthZero(now.month)}-${zero.dayZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.hourZero(now.hour)}:${zero.minuteZero(now.minute)}:${zero.secondZero(now.second)}");
    });
    return chosenDateTime;
  }

}