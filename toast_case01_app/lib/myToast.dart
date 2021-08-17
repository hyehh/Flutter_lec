import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast extends StatelessWidget {
  const MyToast({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: (){
            toastAction();
            // Fluttertoast.showToast(
            //   msg: "Toast Button is clicked",
            //   backgroundColor: Colors.teal,
            //   textColor: Colors.white,
            //   fontSize: 14.0,
            //   toastLength: Toast.LENGTH_SHORT,
            //   );
          },
          child: Text("Toast Button"),
        )
      );
      
  }

  // 함수는 같은 클라스 내에 존재해야 함
  void toastAction() {
    Fluttertoast.showToast(
      msg: "Toast Button is clicked",
      backgroundColor: Colors.teal,
      textColor: Colors.white,
      fontSize: 14.0,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
    );
  }
}