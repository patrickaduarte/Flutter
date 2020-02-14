import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_project/controllers/controller.dart';
import 'package:mobx_project/ui/body.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<Controller>(context); //GetIt.I.get<Controller>();
    
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) { 
            return Text(controller.isValid 
              ? 'Validated form' 
              : 'Invalid form'
            );
          },
        ),
      ),
      body: BodyWidget(),
    );
  }
}