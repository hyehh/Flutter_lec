import 'package:flutter/material.dart';
import 'package:textfield_login_app/info.dart';

class FirstPage extends StatefulWidget {
  // final List<Info> list;
  const FirstPage({ Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Log In"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  // Icon(Icons.verified_user),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/user.png'),
                      radius: 80,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      labelText: "사용자 ID를 입력하세요!"
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: pwController,
                    decoration: InputDecoration(
                      labelText: "패스워드를 입력하세요!"
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if (idController.text == "" || idController.text.isEmpty || pwController.text == "" || pwController.text.isEmpty) {
                        _showErrorSnackBar(context);
                      }else {
                        if (idController.text == "hyehh" && pwController.text == "qwer1234") {
                          // var info = Info(
                          //   id: idController.text,
                          //   pw: pwController.text
                          // );
                          // widget.list.add(info);
                          _dialog(context);
                        }else {
                          _showFailSnackBar(context);
                        }
                      }
                    }, 
                    child: Text("Log In")
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("사용자의 ID와 암호를 입력해주세요!"),
      backgroundColor: Colors.redAccent,
      )
  );
}

void _showFailSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("사용자의 ID와 암호가 일치하지 않습니다!"),
      backgroundColor: Colors.blueAccent,
      )
  );
}

void _dialog(BuildContext context) {
  showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("환영합니다!"),
        content: Text("신분이 확인 되었습니다!"),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/confirm');
            }, 
            child: Text("OK")
            ),
        ],
      );
    }
    );
}