import 'package:flutter/material.dart';
import 'package:task_list/models/assignment.dart';
import 'package:task_list/util/db_helper.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
              itemCount: _assignmentList.length,
              itemBuilder: (_, int position){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                    title: _assignmentList[position],
                    onLongPress: () => _updateTask(_assignmentList[position], position),
                    trailing: Listener(
                      key: Key(_assignmentList[position].taskName),
                      child: Icon(Icons.remove_circle,
                        color: Colors.redAccent,
                      ),
                      onPointerDown: (pointerEvent) => _deleteTask(_assignmentList[position].taskId, position),
                    ),
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
    tasks.forEach((index){
      setState(() {
        _assignmentList.add(Assignment.map(index));
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
                labelText: "Task",
                icon: Icon(Icons.note_add)
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            _manipulateText(_control.text);
            _control.clear();
            Navigator.pop(context);
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
  void _manipulateText(String text) async{
    _control.clear();
    Assignment assignment = new Assignment(text, dateFormat());
    int saveId = await db.saveTask(assignment);

    Assignment itemSave = await db.getTask(saveId);
    setState(() {
      _assignmentList.insert(0, itemSave);
    });
  }

  String dateFormat (){
    var now = DateTime.now();

    initializeDateFormatting("pt_BR", null);
    var format = new DateFormat.yMMMd("pt_BR");
    return format.format(now);
  }
  void _updateTask(Assignment task, int position){
    var alert = AlertDialog(
      title: Text("Update Task"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _control,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Task",
                icon: Icon(Icons.update)
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () async {
            Assignment updateItem = Assignment.fromMap({
              "name": _control.text,
              "date": dateFormat(),
              "id": task.taskId
            });
            _manipulateUpdate(position, task);
            await db.updateTask(updateItem);
            setState(() {
              _takeTasks();
              _control.clear();
              Navigator.pop(context);
            });
          },
          child: Text("Update"),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(context: context, builder:(_) {
      return alert;
    });
  }
  void _manipulateUpdate(int position, Assignment task){
    setState(() {
      _assignmentList.removeWhere((element) => _assignmentList[position].taskName == task.taskName);
    });
  }
  _deleteTask(int id, int position) async {
    await db.deleteTask(id);
    setState(() {
      _assignmentList.removeAt(position);
    });
  }
}