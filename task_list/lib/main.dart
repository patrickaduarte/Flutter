import 'package:flutter/material.dart';
import 'package:task_list/ui/home.dart';

void main() => runApp(Tasks());

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tasks",
      home: Home(),
    );
  }
}