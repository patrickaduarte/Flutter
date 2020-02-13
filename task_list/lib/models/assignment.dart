import 'package:flutter/material.dart';

class Assignment extends StatelessWidget {
  String _taskName;
  String _taskDateCreate;
  int _taskId;

  Assignment(this._taskName, this._taskDateCreate);

  Assignment.map(dynamic obj){
    this._taskName = obj["name"];
    this._taskDateCreate = obj["date"];
    this._taskId = obj["id"];
  }

  String get taskName => _taskName;
  String get taskDateCreate => _taskDateCreate;
  int get taskId => _taskId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _taskName;
    map["date"] = _taskDateCreate;

    if(_taskId != null) {
      map["id"] = _taskId;
    }
    return map;
  }

  Assignment.fromMap(Map<String, dynamic> map){
    this._taskName = map["name"];
    this._taskDateCreate = map["date"];
    this._taskId = map["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_taskName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.9
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text("$taskDateCreate",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 11.5,
                fontStyle: FontStyle.italic 
              ),
            ),
          )
        ],
      ),
    );
  }
}