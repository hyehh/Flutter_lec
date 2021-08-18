import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  const SendPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Mail"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
          child: Row(
            children: [
              Column(
                children: [
                  Text("유비에게 보낸 메일"),
                  Text("관우에게 보낸 메일"),
                  Text("장비에게 보낸 메일"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}