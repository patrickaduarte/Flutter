import 'package:flutter/material.dart';
import 'package:task_list/models/assignment.dart';
import 'package:task_list/util/db_helper.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TextEditingController _control = new TextEditingController();
  var db = new DbHelper();
  final List<Assignment> _assignmentList = <Assignment>[];
  @override
  void initState() {
    super.initState();

    _takeTasks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemBuilder: (_, int position){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                    title: _assignmentList[position],
                    onLongPress: () => debugPrint("Long press"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: ListTile(
          title: Icon(Icons.add),
        ),
        onPressed: _showForm,
      ),
    );
  }

  void _takeTasks() async {
    List tasks = await db.listTasks();
    tasks.forEach((item){
      setState(() {
        _assignmentList.add(Assignment.map(item));
      });
    });
  }
  void _showForm() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _control,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Assignment",
                hintText: "Cook bean",
                icon: Icon(Icons.note_add)
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            debugPrint("Task saved");
          },
          child: Text("Save"),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (_) {
        return alert;
      }
    );
  }
}