import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  //List _data = await getJson();
  List _data = await jsonComplex();

	for(int i = 0; i < _data.length; i++){
		debugPrint("${_data[i]['address']['geo']['lat']}");
		debugPrint("${_data[i]['address']['geo']['log']}");
		debugPrint("${_data[i]['company']['name']}");
	}


  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
      ),
      body: Center(
				child: Row(
					children: <Widget>[
						Column(
							children: <Widget>[
								
							],
						)
					],
				),
      ),
    )
  ));
}


void _showMessage(BuildContext context, String message, String email){
  var alert = new AlertDialog(
    title: Text(email),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("OK"),
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
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
Future<List> jsonComplex() async {
  String url = 'https://jsonplaceholder.typicode.com/users';

  http.Response response = await http.get(url);
  //status code == 200 = OK
  if (response.statusCode == 200){
    return json.decode(response.body);
  }
  else {
    throw Exception('Fail');
  }
}

/* child: ListView.builder(
          itemCount: _data.length,
          padding: const EdgeInsets.all(14.5),
          itemBuilder: (BuildContext context, int position) {
            return Column(children: <Widget>[
                Divider(height: 5.5,),
                ListTile(
                  title: Text(
                    "${_data[position]['email']}"
                  ),
                  /* subtitle: Text(
                    "${_data[position]['body']}"
                  ), */
                  leading: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(
                      "${_data[position]['email'][0]}"
                    ),
                  ),
                  onTap: () => _showMessage(context, _data[position]['body'], _data[position]['email']),
                )
              ],
            ); 
          }
        ), */