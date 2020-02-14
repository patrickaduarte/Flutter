//USED PROVIDER!!!!

import 'package:flutter/material.dart';
import 'package:mobx_project/controllers/controller.dart';
import 'package:mobx_project/ui/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
          dispose: (_, controller) => controller.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

/* 
USED GETIT
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_project/ui/home.dart';

import 'controllers/controller.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<Controller>(Controller());
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      );
  }
} */
