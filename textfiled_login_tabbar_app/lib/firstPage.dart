import 'package:flutter/material.dart';
import 'package:textfiled_login_tabbar_app/animalItem.dart';


class FirstPage extends StatelessWidget {
  final List<Animal> list;

  // 여기가 생성자! requ~ 이 부분이 key 값임!
  const FirstPage({ Key? key, required this.list }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemBuilder: (context, position) {
              // context에는 데이터 내용, position은 위치 기억
              return GestureDetector( // 클릭하면 alert 나와야 하기 때문에 필요
                child: Card( 
                  // 하나의 cell 이 하나의 card 라고 생각하면 됨!
                  child: Row(
                    children: [
                      Image.asset(
                        list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(list[position].animalName,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  _showDialog(context, list[position].kind, list[position].animalName);
                },
              ); 
            },
            // 몇 개 있는지 알아야 그 개수만큼 cell 만들어짐!
            itemCount: list.length,
            ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, String kind, String animalName) {
  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("$animalName"),
        content: Text("이 동물은 $kind 입니다."),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal)
            ),
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text("종료")
            ),
        ],
      );
    }
    );
}