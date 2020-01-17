import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Center(
        child: new Text("Hello World!", 
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontSize: 34.0,
          fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}