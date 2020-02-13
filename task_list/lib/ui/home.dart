import 'package:flutter/material.dart';
import 'package:task_list/ui/tasks_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: TasksScreen(),
    );
  }
}