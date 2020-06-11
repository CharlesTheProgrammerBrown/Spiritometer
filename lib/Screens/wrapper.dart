import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Authenticate/authenticate.dart';
import 'package:spiritometer/Screens/Home/Home.dart';

//wrapper widget listens to state of Authentication
//whether user is signed in or not


class Wrapper  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //dynamically returns home screen or authentication
    return Authenticate();
  }
}