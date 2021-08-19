import 'package:flutter/material.dart';
import 'package:listview_exercise_app/firstPage.dart';
import 'package:listview_exercise_app/secondPage.dart';
import 'package:listview_exercise_app/countryItem.dart';

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
with SingleTickerProviderStateMixin{

  late TabController controller;
  List<Country> countryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    countryList.add(Country(
      countryName: '미국',
      imagePath: 'images/america.png'
      ),
      );
    countryList.add(Country(
      countryName: '오스트리아',
      imagePath: 'images/austria.png'
      ),
      );
    countryList.add(Country(
      countryName: '벨기에',
      imagePath: 'images/belgium.png'
      ),
      );
    countryList.add(Country(
      countryName: '캐나다',
      imagePath: 'images/canada.png'
      ),
      );
    countryList.add(Country(
      countryName: '중국',
      imagePath: 'images/china.png'
      ),
      );
    countryList.add(Country(
      countryName: '에스토니아',
      imagePath: 'images/estonia.png'
      ),
      );
    countryList.add(Country(
      countryName: '프랑스',
      imagePath: 'images/france.png'
      ),
      );
    countryList.add(Country(
      countryName: '독일',
      imagePath: 'images/germany.png'
      ),
      );
    countryList.add(Country(
      countryName: '그리스',
      imagePath: 'images/greece.png'
      ),
      );
    countryList.add(Country(
      countryName: '헝가리',
      imagePath: 'images/hungary.png'
      ),
      );
    countryList.add(Country(
      countryName: '이탈리아',
      imagePath: 'images/italy.png'
      ),
      );
    countryList.add(Country(
      countryName: '한국',
      imagePath: 'images/korea.png'
      ),
      );
    countryList.add(Country(
      countryName: '라트비아',
      imagePath: 'images/latvia.png'
      ),
      );
    countryList.add(Country(
      countryName: '리트후아니아',
      imagePath: 'images/lithuania.png'
      ),
      );
    countryList.add(Country(
      countryName: '룩셈브루크',
      imagePath: 'images/luxemburg.png'
      ),
      );
    countryList.add(Country(
      countryName: '네덜란드',
      imagePath: 'images/netherland.png'
      ),
      );
    countryList.add(Country(
      countryName: '로마니아',
      imagePath: 'images/romania.png'
      ),
      );
    countryList.add(Country(
      countryName: '터키',
      imagePath: 'images/turkey.png'
      ),
      );
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
        title: Text("국가명 맞추기"),
      ),
      body: TabBarView(
        children: [
          FirstPage(
            list: countryList,
          ),
          SecondPage(
            list: countryList,
          ),
        ],
        controller: controller,
        ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.teal,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.amber,
            ),
          ),
        ],
        controller: controller,
        ),
    );
  }
}