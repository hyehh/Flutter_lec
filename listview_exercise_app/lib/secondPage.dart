import 'package:flutter/material.dart';
import 'package:listview_exercise_app/countryItem.dart';

class SecondPage extends StatefulWidget {
  final List<Country> list;
  const SecondPage({ Key? key, required this.list}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  final questionController = TextEditingController();
  final answerController = TextEditingController();
  late String imgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                TextField(
                  controller: questionController,
                  decoration: InputDecoration(
                    labelText: "문제를 입력하세요!"
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: answerController,
                  decoration: InputDecoration(
                    labelText: "장딥를 입력하세요!"
                  ),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          'images/america.png',
                          width: 80,
                        ),
                        onTap: (){
                          imgPath = "images/america.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/china.png',
                          width: 80,
                        ),
                        onTap: (){
                          imgPath = "images/china.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/france.png',
                          width: 80,
                        ),
                        onTap: (){
                          imgPath = "images/france.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/korea.png',
                          width: 80,
                        ),
                        onTap: (){
                          imgPath = "images/korea.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/turkey.png',
                          width: 80,
                        ),
                        onTap: (){
                          imgPath = "images/turkey.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/italy.png',
                          width: 80,
                        ),
                        onTap: (){
                          imgPath = "images/italy.png";
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){
    
                    var country = Country(
                      countryName: answerController.text,
                      imagePath: imgPath,
                    );
    
                    _showDialog(context, country, widget.list);

                  //   showDialog(
                  //     context: context, 
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         title: Text("문제 추가하기"),
                  //         content: Text("이 국가의 문제는 ${answerController.text[0]}____ 입니다. 그리고 이 문제의 정답은 ${answerController.text} 입니다. 이 문제를 추가하시겠습니까?"),
                  //         actions: [
                  //           ElevatedButton(
                  //             onPressed: (){
                  //               widget.list.add(country);
                  //               Navigator.of(context).pop();
                  //             }, 
                  //             child: Text("예")
                  //             ),
                  //           ElevatedButton(
                  //             onPressed: (){
                  //               Navigator.of(context).pop();
                  //             }, 
                  //             child: Text("아니오")
                  //             ),
                  //         ],
                  //       );
                  //     }
                  //  );
                    
                  }, 
                  child: Text("문제 추가하기")
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, Country country, List list) {
  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("문제 추가하기"),
        content: Text("이 국가의 문제는 ${country.countryName[0]}____ 입니다. 그리고 이 문제의 정답은 ${country.countryName} 입니다. 이 문제를 추가하시겠습니까?"),
        actions: [
          ElevatedButton(
            onPressed: (){
              list.add(country);
              Navigator.of(context).pop();
            }, 
            child: Text("예")
            ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text("아니오")
            ),
        ],
      );
    }
    );
}