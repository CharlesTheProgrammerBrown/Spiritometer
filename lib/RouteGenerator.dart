import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Pages/PrayNow.dart';
import 'package:spiritometer/Screens/Pages/ROR.dart';
import 'package:spiritometer/Screens/wrapper.dart';
import 'package:spiritometer/UI/CountDownTimer.dart';
import './Screens/Home/Home.dart';
//import './Screens/LoginScreen.dart';
//import './Screens/Authenticate/LoginScreen.dart';
import './Screens/Authenticate/RegisterScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //data you're passing

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          //made wrapper the root route
            builder: (BuildContext context) => Wrapper());
        break;
      case '/prayNow':
        return MaterialPageRoute(builder: (_) => PrayNow());

       /* case '/countDownTimer':
        return MaterialPageRoute(builder: (_) => CountDownTimer());
*/
      case '/RoR':
      return MaterialPageRoute(builder: (_)=> RoR());

       case '/bibleStudy':
      return MaterialPageRoute(builder: (_)=> PrayNow());

       case '/schedule':
      return MaterialPageRoute(builder: (_)=> PrayNow());

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