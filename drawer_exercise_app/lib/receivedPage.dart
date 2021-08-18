import 'package:flutter/material.dart';

class ReceivedPage extends StatelessWidget {
  const ReceivedPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Received Mail"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
          child: Row(
            children: [
              Column(
                children: [
                  Text("유비에게 온 메일"),
                  Text("관우에게 온 메일"),
                  Text("장비에게 온 메일"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}