import 'package:flutter/material.dart';

class DetectorEvents extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: MyButton(),
        ),
    );
  }
}
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Hello Gestures/Events"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(5.5)        
        ),
      child: Text("My Button"),
      ),
    );
  }
}