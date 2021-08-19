import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:listview_app/animalItem.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({ Key? key, required this.list }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text, 
                    // 1줄만!
                    maxLines: 1,
                  ),
                  Row(
                    // 간격 균등하게 맞춰줌
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Radio(
                        value: 0, 
                        // 그룹 잡아야 세 개 중 하나만 선택 가능!
                        groupValue: _radioValue,
                        // 선택했을 때! 
                        onChanged: _radioChange,
                        ),
                        Text("양서류"),
                      Radio(
                        value: 1, 
                        // 그룹 잡아야 세 개 중 하나만 선택 가능!
                        groupValue: _radioValue,
                        // 선택했을 때! 
                        onChanged: _radioChange,
                        ),
                        Text("파충류"),
                      Radio(
                        value: 2, 
                        // 그룹 잡아야 세 개 중 하나만 선택 가능!
                        groupValue: _radioValue,
                        // 선택했을 때! 
                        onChanged: _radioChange,
                        ),
                        Text("포유류"),
                    ],
                    ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("날 수 있나요?"),
                      Checkbox(
                        value: flyExist,            
                        onChanged: (check) {
                          setState(() {
                            flyExist = check!;
                          });
                        }
                        ),
                    ],
                  ),
                  Container(
                    // child 하나 밖에 못쓰나, width와 height를 줄 수 있음
                    height: 100,
                    child: ListView(
                      // 좌우로 움직이는 list view 만든 것임!
                      scrollDirection: Axis.horizontal,
                      children: [
                        // 데이터 주기!
                        GestureDetector(
                          // 움직이면서 클릭했을 때 동작도 줘야함
                          child: Image.asset(
                            'images/cow.png',
                            width: 80,
                          ),
                          onTap: (){
                            _imagePath = "images/cow.png";
                          },
                        ),
                        GestureDetector(
                          // 움직이면서 클릭했을 때 동작도 줘야함
                          child: Image.asset(
                            'images/dog.png',
                            width: 80,
                          ),
                          onTap: (){
                            _imagePath = "images/dog.png";
                          },
                        ),
                        GestureDetector(
                          // 움직이면서 클릭했을 때 동작도 줘야함
                          child: Image.asset(
                            'images/pig.png',
                            width: 80,
                          ),
                          onTap: (){
                            _imagePath = "images/pig.png";
                          },
                        ),
                        GestureDetector(
                          // 움직이면서 클릭했을 때 동작도 줘야함
                          child: Image.asset(
                            'images/bee.png',
                            width: 80,
                          ),
                          onTap: (){
                            _imagePath = "images/bee.png";
                          },
                        ),
                        GestureDetector(
                          // 움직이면서 클릭했을 때 동작도 줘야함
                          child: Image.asset(
                            'images/cat.png',
                            width: 80,
                          ),
                          onTap: (){
                            _imagePath = "images/cat.png";
                          },
                        ),
                        GestureDetector(
                          // 움직이면서 클릭했을 때 동작도 줘야함
                          child: Image.asset(
                            'images/monkey.png',
                            width: 80,
                          ),
                          onTap: (){
                            _imagePath = "images/monkey.png";
                          },
                        ),
                        GestureDetector(
                          // 움직이면서 클릭했을 때 동작도 줘야함
                          child: Image.asset(
                            'images/fox.png',
                            width: 80,
                          ),
                          onTap: (){
                            _imagePath = "images/fox.png";
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    onPressed: (){
                      // 데이터 만들기
                      var animal = Animal(
                        animalName: nameController.text,
                        kind: getKind(_radioValue),
                        imagePath: _imagePath,
                        flyExist: flyExist);
    
                      // AlertDialog 만들기
                      AlertDialog dialog = AlertDialog(
                        title: Text("동물 추가하기"),
                        content: Text(
                          "이 동물은 ${animal.animalName} 입니다."
                          "이 동물의 종류는 ${animal.kind} 입니다. \n"
                          "이 동물을 추가하시겠습니까?",
                          style: TextStyle(
                            fontSize: 17.0
                          ),
                          ),
                        actions: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.teal),
                            ),
                            onPressed: (){
                              // widget을 써야 list 에 추가 가능!
                              widget.list.add(animal);
                              Navigator.of(context).pop();  
                            }, 
                            child: Text("확인")
                            ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            onPressed: (){
                              Navigator.of(context).pop();  
                            }, 
                            child: Text("취소")
                            ),
                        ],
                      );
    
                      // 화면에 AlertDialog 만든 것 띄워주기!
                      showDialog(
                        context: context, 
                        builder: (BuildContext context) {
                          return dialog;
                        }
                        );
                    }, 
                    child: Text("동물 추가")
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _radioChange(int? value) {
  // 클릭 시 라디오 버튼 체크된 모양으로 변경시키기 (화면이 바뀌어야 함!)
  setState(() {
      _radioValue = value!;
  });
}

  getKind(int radioValue) {
    // break 없이 사용 가능!
    switch(radioValue){
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }
}