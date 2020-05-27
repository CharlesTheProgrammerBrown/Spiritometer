import 'package:flutter/material.dart';
import './Screens/MainPage.dart';
import './Screens/LoginScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //data you're passing

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
        break;
      case '/second':
        return MaterialPageRoute(builder: (_) => MainPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }



 static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}