import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_project/controllers/controller.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  
  _textField({String labelText, onChange, String Function() errorText}) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    
    final controller = Provider.of<Controller>(context);//GetIt.I.get<Controller>();
    
    return Container(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Observer(
            builder: (_) => _textField(
                errorText: controller.validateName,
                labelText: "Name",
                onChange: controller.client.changeName,
              ),
          ),
          SizedBox(
            height: 20,
          ),
          Observer(
            builder: (_) => _textField(
                errorText: controller.validateEmail,
                labelText: "Email",
                onChange: controller.client.changeEmail,
              ),
          ),
          SizedBox(
            height: 30,
          ),
          Observer(
            builder: (_) => Center(
              child: RaisedButton(
                onPressed: controller.isValid ? () {} : null,
                child: Text("Salvar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),
                ),
                color: Colors.blueAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}