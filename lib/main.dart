import 'package:flutter/material.dart';
import 'package:spiritometer/RouteGenerator.dart';
import 'package:provider/provider.dart';
import 'package:spiritometer/Services/auth.dart';
import 'package:spiritometer/models/user.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      //stream to listen 2 & expctd data
          value:AuthService().user,
          //pass on stream to all children widget
          child: MaterialApp(
          initialRoute: '/', onGenerateRoute: RouteGenerator.generateRoute
          //home: LoginScreen(),
          ),
    );
  }
}



