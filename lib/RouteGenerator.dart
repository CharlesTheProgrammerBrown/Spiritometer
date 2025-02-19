import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Pages/EditRhapsodyRecord.dart';
import 'package:spiritometer/Screens/Pages/ErrorPage.dart';
import 'package:spiritometer/Screens/Pages/PrayNow.dart';
import 'package:spiritometer/Screens/Pages/Profile.dart';
import 'package:spiritometer/Screens/Pages/RhapsodyMenu.dart';
import 'package:spiritometer/Screens/Pages/RhapsodyRecord.dart';
import 'package:spiritometer/Screens/wrapper.dart';
import 'package:spiritometer/UI/CountDownTimer.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';

import 'Screens/Home/Home.dart';
import 'Screens/Pages/RhapsodyNavigation.dart';

//import './Screens/LoginScreen.dart';
//import './Screens/Authenticate/LoginScreen.dart';

class RouteGenerator {
  static get time => null;

  static List<File> get pathFiles => null;

  static UserRhapsodyModel get rhapsodyToEdit => null;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //data you're passing

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            //made wrapper the root route
            builder: (BuildContext context) => Wrapper());
        break;

      case '/home':
        return MaterialPageRoute(builder: (_) => Home());

      case '/errorPage':
        return MaterialPageRoute(builder: (_) => ErrorPage());

      case '/profilePage':
        return MaterialPageRoute(builder: (_) => Profile());

      case '/prayNow':
        return MaterialPageRoute(builder: (_) => PrayNow());

      case '/countDownTimer':
        return MaterialPageRoute(
            builder: (_) => CountDownTimer(time, pathFiles));

      case '/RoR':
        return MaterialPageRoute(builder: (_) => RhapsodyMenu());

      case '/RhapsodyNav':
        return MaterialPageRoute(builder: (_) => RhapsodyNavigation());

      case '/bibleStudy':
        return MaterialPageRoute(builder: (_) => PrayNow());

      case '/schedule':
        return MaterialPageRoute(builder: (_) => PrayNow());

      case '/rhapsodyRecord':
        return MaterialPageRoute(builder: (_) => RhapsodyRecord());

      case '/editRhapsodyRecord':
      return MaterialPageRoute(builder: (_)=>EditRhapsodyRecord(rhapsodyToEdit));

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
