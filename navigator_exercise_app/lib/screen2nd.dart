import 'package:flutter/material.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Received Mail"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("유비에게 온 메일"),
                    Text("장비에게 온 메일"),
                    Text("조조에게 온 메일"),
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