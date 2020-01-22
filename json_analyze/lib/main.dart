import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  List _data = await getJson();
  String _body = "";
  
  /* for(int i = 0; i < _data.length; i++){
    debugPrint("Name: ${_data[i]['name']}");
    debugPrint("Id: ${_data[i]['id']}");
  } */

  _body = _data[0]['body'];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Body: $_body',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.pinkAccent
                ),
              ),
            ),
          ],
        ),
      ),
    )
  ));
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
