import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(new MaterialApp(
    title: "I/O",
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _dataController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read/Write"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _dataController,
              decoration: InputDecoration(labelText: "Write something"),
            ),
            Padding (padding: EdgeInsets.all(14.9)),
            FlatButton(
              color: Colors.greenAccent,
              onPressed: (){
              writeData(_dataController.text);
            }, child: Text("Write")),
            FutureBuilder(
              future: readData(),
              builder: (BuildContext context, AsyncSnapshot<String> data){
                if(data.hasData != null) {
                  return Text(
                    data.data,
                    style: TextStyle(
                      color: Colors.pinkAccent
                    ),
                  );
                }
                else {
                  return Text("Nothing has yet been saved.");
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory(); 
  return directory.path; //home/directory/...
}

Future<File> get _localArchive async {
  final path = await _localPath;

  return new File('$path/data.txt'); //home/directory/data.txt
}

//Write
Future<File> writeData(String message) async {
  final archive = await _localArchive;

  return archive.writeAsString('$message');
}

//Read
Future<String> readData() async {
  try {
    final archive = await _localArchive;
    return await archive.readAsString();
  }
  catch(e){
    return "Nothing has yet been saved.";
  }
}