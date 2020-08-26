import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 16.0),
      child: Scaffold(
        // backgroundColor: ,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF8f94fb),
          title: Text(
            'Error Page',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Error.png',
                height: 100,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: RichText(
                  text: TextSpan(
                      text: 'An unexpected Error Occurred.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "OpenSans"),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Click Here To Go To Home Screen',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 19),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  '/home',
                                );
                              })
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
