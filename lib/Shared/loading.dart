import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Colors.green[200],
              //Colors.blue[100],
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: 150.0),
              Image.asset('assets/images/logo_name_transparent copy.png',
                  height: 130, width: double.infinity),
              SizedBox(height: 50.0),
              SpinKitFadingCircle(color: Colors.white, size: 50.0),
              SizedBox(height: 150.0)
            ],
          ),
        ));
  }
}
