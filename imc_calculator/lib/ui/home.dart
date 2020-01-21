import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("IMC Calculator",),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/imc-logo.png',
              height: 100.0,
              width: 150.0,
            ),
            Container(
              color: Colors.black12,
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Years Old',
                      hintText: 'Years',
                      icon: Icon(Icons.person),
                    )
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height(m)',
                      hintText: 'Meters',
                      icon: Icon(Icons.poll),
                    )
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight(kg)',
                      hintText: 'Kg',
                      icon: Icon(Icons.line_weight),
                    )
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            onPressed: ()=>{},
                            color: Colors.pink,
                            child: Text("Calcule",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.5,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text("22.96",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blueAccent,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}