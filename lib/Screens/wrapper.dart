import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiritometer/Screens/Authenticate/authenticate.dart';
import 'package:spiritometer/Screens/Home/Home.dart';
import 'package:spiritometer/models/user.dart';
//import 'package:spiritometer/Screens/Home/Home.dart';

//wrapper widget listens to state of Authentication
//whether user is signed in or not


class Wrapper  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //dynamically returns home screen or authentication
    final user = Provider.of<User>(context);
    
    return user==null? Authenticate() : Home();
  }
}