import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 1;
  String _namePlanet = "";

  bool selecionValueA = true;
  bool selecionValueB = false;
  bool selecionValueC;
  bool selecionValueD;
  bool switchValue;

  double _finalResult = 0.0;

  void guardValue(int value){
    setState(() {
      radioValue = value;
      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _namePlanet = "Weight in Pluto is ${_finalResult.toStringAsFixed(2)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _namePlanet = "Weight in Mars is ${_finalResult.toStringAsFixed(2)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _namePlanet = "Weight in Venus is ${_finalResult.toStringAsFixed(2)}";
          break;
        case 3:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _namePlanet = "Weight in Mercury is ${_finalResult.toStringAsFixed(2)}";
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X",),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'O seu peso na Terra',
                      hintText: 'Kg',
                      icon: Icon(Icons.person_outline)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.brown,
                        value: 0, 
                        groupValue: radioValue,
                        onChanged: guardValue,
                      ),
                      Text("Pluto",
                        style: TextStyle(
                          color: Colors.white30 
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValue, 
                        onChanged: guardValue,
                      ),
                      Text("Mars",
                        style: TextStyle(
                          color: Colors.white30 
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2, 
                        groupValue: radioValue, 
                        onChanged: guardValue,
                      ),
                      Text("Venus",
                        style: TextStyle(
                          color: Colors.white30 
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.blueAccent,
                        value: 3, 
                        groupValue: radioValue, 
                        onChanged: guardValue,
                      ),
                      Text("Mercury",
                        style: TextStyle(
                          color: Colors.white30 
                        ),
                      ),
                    ],
                  ),
                  Text(
                    _weightController.text.isEmpty ? "Insert your weight" : _namePlanet + "Kg",
                    //"$_namePlanet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  double calculateWeight (String weightPlanet, double superficialGravity){
    if (double.parse(weightPlanet).toString().isNotEmpty && double.parse(weightPlanet) > 0){
      return (double.parse(weightPlanet) * superficialGravity);
    }
    /* else {
      print("Wrong number");
      return int.parse("180") * 0.38; //Returns default weight
    } */
  }
}