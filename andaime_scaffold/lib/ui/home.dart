import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Scaffold"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.accessible),onPressed: () => debugPrint("Accessible"),),
          IconButton(icon: new Icon(Icons.print),onPressed: () => debugPrint("Print"),),
          IconButton(icon: new Icon(Icons.alarm),onPressed: () => debugPrint("Alarm"),),
        ],
      ),
    );
  }
}