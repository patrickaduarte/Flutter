import 'package:flutter/material.dart';

class Home extends StatelessWidget {
void botaoFlutuante => debugPrint("Floating Button");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.accessible),onPressed: () => debugPrint("Accessible"),),
          IconButton(icon: Icon(Icons.print),onPressed: () => debugPrint("Print"),),
          IconButton(icon: Icon(Icons.alarm),onPressed: () => debugPrint("Alarm"),),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Bonni",
            style: TextStyle(
            fontSize: 19.5,
            fontWeight: FontWeight.w700,
            color: Colors.deepOrange
            ),),
            Padding(padding: EdgeInsets.all(15.0),
              child: InkWell(
                child: Text("Clique",
                style: TextStyle(
                  fontSize: 16.0,
                ),),
                onTap: () => debugPrint("Tap"),
                onDoubleTap: () => debugPrint("Double Tap"),
                onLongPress: () => debugPrint("Long Tap"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), title: Text("Profile")),
        BottomNavigationBarItem(icon: Icon(Icons.print), title: Text("Print"))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: botaoFlutuante,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,

      ),
    );
  }
}