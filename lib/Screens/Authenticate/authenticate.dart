import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Authenticate/LoginScreen.dart';
import 'package:spiritometer/Screens/Authenticate/RegisterScreen.dart';

//wrapper of sign in and sign up, which shows one at a time
//another wrapper listens in on the state of this wrapper,
//if on sign in go to home otherwise login screen when user opens app

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
//default signIn page
  bool showSignIn = true;

//change state if user opens another page but allow toggling
//no hardcoding state so toggling possible
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

//authentication wrapper returns login or Register depending
//on toggle state
  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      //send the toggle func to Login and Register page
      return LoginScreen(toggleViewResult: toggleView);
    } else {
      return RegisterScreen(toggleViewResult: toggleView);
    }
  }
}
