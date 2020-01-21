import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  
  String _printIdeal = "";
  double _finalResult = 0.0;
  
  void printImc(){
    setState(() {
      _finalResult = calculateImc(_weightController.text, _heightController.text);
      
      if (_finalResult >= 40){
        _printIdeal = "Obesity III";
        _finalResult.toString();
      }
      else if(_finalResult >= 35){
        _printIdeal = "Obesity II";
        _finalResult.toString();
      }
      else if(_finalResult >= 30){
        _printIdeal = "Obesity I";
        _finalResult.toString();
      }
      else if(_finalResult >= 25){
        _printIdeal = "Overweight";
        _finalResult.toString();
      }
      else if(_finalResult >= 18.5){
        _printIdeal = "Normal weight";
        _finalResult.toString();
      }
      else {
         _printIdeal = "Under weight";
         _finalResult.toString();
      }
    });
  }

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
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height(m)',
                      hintText: 'Meters',
                      icon: Icon(Icons.poll),
                    )
                  ),
                  TextField(
                    controller: _weightController,
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
                            onPressed: printImc,
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
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text(_finalResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blueAccent,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text(_printIdeal,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.pink,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
double calculateImc (String peopleWeight, String peopelHeight){
   if (double.parse(peopleWeight).toString().isNotEmpty && double.parse(peopelHeight).toString().isNotEmpty){
      return (double.parse(peopleWeight) / (double.parse(peopelHeight) * (double.parse(peopelHeight))));
    }
}