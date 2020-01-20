import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Tycoon"),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
      ],),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text ("Be rich!",
            style: TextStyle(
              fontSize: 30.0,
              //fontWeight: FontWeight.w700,
              color: Colors.grey
              ),
            ),
            Text ("@ 9300",
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton(
              onPressed: () => debugPrint("Teste"),
              color: Colors.lightGreen,
              child: Text('More Money!',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white 
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}