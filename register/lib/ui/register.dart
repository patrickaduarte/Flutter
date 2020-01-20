import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _welcome = "";

  void _printWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _passController.text.isNotEmpty){
        debugPrint(_passController.text);
        _welcome = 'Welcome ${_userController.text}';
      } else {
        _welcome = "User not found";
      }
    });
  }
  void _cancel(){
    setState(() {
      _userController.clear();
      _passController.clear();
      _welcome = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",),
        backgroundColor: Colors.deepOrange,
      ),    
      backgroundColor: Colors.amber,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset("assets/face.png",
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),
            Container(
              width: double.infinity,
              color:  Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _userController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.5),
                        ),
                        //icon: Icon(Icons.person)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _passController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.5),
                        ),
                        //icon: Icon(Icons.lock)
                      ),
                      obscureText: true,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          //margin: const EdgeInsets.only(left: 38.0),
                          child: RaisedButton(
                            onPressed: _printWelcome,
                            color: Colors.deepOrange,
                            child: Text("Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          //margin: const EdgeInsets.only(left: 118.0),
                          child: RaisedButton(
                            onPressed: _cancel,
                            color: Colors.white,
                            child: Text("Clear",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 16.9,
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("$_welcome",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ), 
    );
  }
}