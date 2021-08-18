import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mail"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/sendPage');
            }, 
            icon: Icon(Icons.email),
            ),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/receivedPage');
            }, 
            icon: Icon(Icons.email_outlined),
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/p1.png',
                ),
                backgroundColor: Colors.white,
              ),
              accountName: Text("Pickachu"), 
              accountEmail: Text("pickachu@naver.com"),
              onDetailsPressed: (){
                print("Drawer is clicked!");
              },
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )
              ),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text('보낸 편지함'),
                onTap: (){
                  Navigator.pushNamed(context, '/sendPage');
                },
              ),
             ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.redAccent,
                ),
                title: Text('받은 편지함'),
                onTap: (){
                  Navigator.pushNamed(context, '/receivedPage');
                },
              ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/sendPage');
              }, 
              child: Text("보낸 편지함"),
              ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/receivedPage');
              }, 
              child: Text("받은 편지함"),
              ),
          ],
        ),
      ),
    );
  }
}