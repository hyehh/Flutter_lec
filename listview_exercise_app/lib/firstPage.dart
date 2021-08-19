import 'package:flutter/material.dart';
import 'package:listview_exercise_app/countryItem.dart';

class FirstPage extends StatelessWidget {

  final List<Country> list;

  const FirstPage({ Key? key, required this.list }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        list[position].imagePath,
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${list[position].countryName[0]}____",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  _showDialog(context, list[position].countryName);
                },
              );
            },
            itemCount: list.length,
            ),
        ),
      )
    );
  }
}

void _showDialog(BuildContext context, String countryName) {
  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("국가명"),
        content: Text("이 국가는 $countryName 입니다."),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text("종료")
            )
        ],
      );
    }
    );
}