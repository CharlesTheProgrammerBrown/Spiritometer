import 'package:flutter/material.dart';
import 'package:spiritometer/RouteGenerator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/', onGenerateRoute: RouteGenerator.generateRoute
        //home: LoginScreen(),
        );
  }
}



