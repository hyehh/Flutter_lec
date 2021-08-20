import 'package:flutter/material.dart';
import 'package:textfield_login_app/info.dart';

class ConfirmPage extends StatelessWidget {
  // final List<Info> list;
  final String id;
  const ConfirmPage({ Key? key, required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "사용자의 ID는 $id 입니다!",
              style: TextStyle(
                fontSize: 20
              ),
              ),
            Image.asset('images/picachu1.png'),
          ],
        ),
      ),
    );
  }
}