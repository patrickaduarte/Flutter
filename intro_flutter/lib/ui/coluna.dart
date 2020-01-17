import 'package:flutter/material.dart';

class Coluna extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.blueAccent,
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Text("Primeiro",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontStyle: FontStyle.italic,
          fontSize: 19.0),),

          //Expanded(child: Text("Ola"),),
          //Flexible(child: Text("Outro"),),
          
          Text("Segundo",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontStyle: FontStyle.italic,
          fontSize: 19.0),),

          FlatButton(onPressed: ()=> "Hello World",
          color: Colors.white70,
          child: Text("Botão"),)
        ],     
      ),
    );
  }
}