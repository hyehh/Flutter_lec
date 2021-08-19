import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/p1.png'),
              radius: 50.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/p2.png'),
                  radius: 50.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/p3.png'),
                  radius: 50.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}