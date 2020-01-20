import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int _contadorGrana = 0;
  MaterialColor _colorMoney = Colors.red;
  void _moreMoney(){

    setState(() {
      _contadorGrana += 1000;//Atualiza os valores da tela.
      if (_contadorGrana >= 10000){
        _colorMoney = Colors.green;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tycoon"),
        backgroundColor: Colors.lightGreen,
        ),

      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text("Be rich!",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 30.0
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text("\$ $_contadorGrana",
                  style: TextStyle(
                    fontSize: 45.6,
                    color: _colorMoney,
                    //_contadorGrana >= 10000 ? Colors.green : Colors.amber,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ,)
            ,),
            Expanded(
              child: Center(
                child: FlatButton(
                  onPressed: _moreMoney,
                  child: Text("More money!",
                    style: TextStyle(
                      fontSize: 19.9
                    ),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}