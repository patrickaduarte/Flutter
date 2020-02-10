import 'package:flutter/material.dart';

void main() => runApp(
  Home()
);
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB Project"),
        backgroundColor: Colors.black38,
      ),
    );
  }
}