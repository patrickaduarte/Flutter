import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map _data;
List _features;

void main () async {
  _data = await catchEarthquakes();
  _features = _data['features'];

  runApp(
    new MaterialApp(
    home: Earthquake(),
    )
  );
}


class Earthquake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earthquakes"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: 
        ListView.builder(
          itemCount: _features.length,
          padding: EdgeInsets.all(14.5),
          itemBuilder: (BuildContext context, int position){
            
            var format = new DateFormat.yMMMMd("en_US").add_jm();
            var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(_features[position]['properties']['time'] * 1000));
            
            return Column (
              children: <Widget>[
                Divider(height: 5.5,),
                ListTile(
                  title: Text(
                    "$date",
                    style: TextStyle(
                      fontSize: 15.5,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                    "${_features[position]['properties']['place']}",
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(
                      "${_features[position]['properties']['mag']}",
                      style: TextStyle(
                        fontSize: 16.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal
                      ),
                    ),
                  ),
                  onTap: () {
                    _showMessage(context, "${_features[position]['properties']['mag']}", "${_features[position]['properties']['place']}");
                  } 
                )
              ],
            );
          },
        )
      ),
    );
  }
}

Future<Map> catchEarthquakes () async {
  String url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(url);
  return json.decode(response.body);
}

void _showMessage(BuildContext context, String mag, String place){
  var alert = new AlertDialog(
    title: Text("Earthquake"),
    content: Text("M $mag - $place"),
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