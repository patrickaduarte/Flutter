import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: 'Flutter test cities'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List locais = [
    "Beira",
    "Maputo",
    "Curitiba",
    "Rio de Janeiro",
    "Lisboa",
    "Chimoio",
    "São Fransico",
    "Porto",
    "Washington",
    "Pelotas",
    "São Lourenço",
    "New York"
  ];

  /*List<MaterialColor> cores = [

    Colors.black,
    Colors.cyan,
    Colors.grey,
    Colors.lime,
    Colors.pink,
    Colors.red,
    Colors.teal,
    Colors.white,
    Colors.yellow
  ];*/
  List<MaterialColor> cores = [
    Colors.amber,
    Colors.green,
    Colors.brown,
    Colors.orange,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.cyan,
    Colors.grey,
    Colors.lime,
    Colors.pink,
    Colors.red,
    Colors.teal
  ];

  String randomText = "";
  MaterialColor randomCores = Colors.blue;

  void _atualizarTela() {
    setState(() {
      randomText = locais[new Random().nextInt(locais.length)];
      randomCores= cores[new Random().nextInt(cores.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: _atualizarTela,
              color: randomCores,
              child: Text('Clique!'),
            ), 
          
            Text(
              '$randomText',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods. */
    );
  }
}
