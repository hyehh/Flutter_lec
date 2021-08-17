import 'package:flutter/material.dart';

class Screen1st extends StatelessWidget {
  const Screen1st({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Send Mail"),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("유비에게 보낸 메일"),
                    Text("장비에게 보낸 메일"),
                    Text("조조에게 보낸 메일"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}