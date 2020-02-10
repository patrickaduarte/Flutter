import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _dataController = new TextEditingController();
  String _dataSave = "";

  @override
  void initState() {
    super.initState();
    _takeDate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shared prefs"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          padding: const EdgeInsets.all(13.4),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: "Write somethings"
                ),
              ),
              Padding(padding: const EdgeInsets.all(10.0)),
              FlatButton(
                onPressed: () {
                  _saveDate(_dataController.text);
                },
                child: Text("Save data"),
                color: Colors.deepOrange,
              ),
              Text("$_dataSave",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _takeDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String info = prefs.getString('data');
    setState(() {
      if(info != null && info.isNotEmpty){
        _dataSave = info;
      }
      else {
        _dataSave = "Empty";
      }
    });
  }
  void _saveDate(String message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('data', message);
  }
}

