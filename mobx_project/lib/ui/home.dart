import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  _textField({String labelText, onChange}) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: "erro"//errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _textField(
              labelText: "Name"
            )
          ],
        ),
      ),
    );
  }
}