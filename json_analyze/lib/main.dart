import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  List data = await getJson();
  
  for(int i = 0; i < data.length; i++){
    debugPrint("Name: ${data[i]['name']}");
    debugPrint("Id: ${data[i]['id']}");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}

Future<List> getJson() async {
  String url = 'https://jsonplaceholder.typicode.com/comments';

  http.Response response = await http.get(url);
  //status code == 200 = OK
  if (response.statusCode == 200){
    return json.decode(response.body);
  }
  else {
    throw Exception('Fail');
  }
}
