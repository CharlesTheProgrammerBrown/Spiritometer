import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spiritometer/Utilities/constants.dart';
import 'package:spiritometer/UI/CustomInputField.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
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
                      stops: [0.1, 0.4, 0.7, 0.9]),
                ),
                //color: Colors.blueGrey[200],
              ),
              Container(
                // width: 400,
                height: double.infinity,
                //margin: EdgeInsets.only(top: 25),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //SIGN IN AT TOP PAGE
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 12.0),

                      //LOGO
                      //needs to be loaded before, try init state
                      Image.asset(
                          'assets/images/logo_name_transparent copy.png',
                          height: 130,
                          width: double.infinity),
                      SizedBox(height: 10.0),

                      //INPUT FIELDS
                      //pass Icon,icon color & txt label & hint text,hiding txt-true or false 
                      //to constructor
                      CustomInputField(Icon(Icons.email, color: Colors.white),
                          'Email', 'Enter your Email',false),
                      CustomInputField(Icon(Icons.lock, color: Colors.white),
                          'Password', 'Enter your Password',true),

                      //Forgot Password
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                            onPressed: null,
                            child: Text(
                              'Forgot Password',
                              style: uiLabelStyle,
                            )),
                      ),
                    
                    //Remember me checkbox
                      Container(
                          height: 20,
                          //color: Colors.yellow,
                          child: Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Colors.white),
                                child: Checkbox(
                                  value: _rememberMe,
                                  checkColor: Colors.green[600],
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: uiLabelStyle,
                              ),
                            ],
                          )),

                      //LOGIN button
                      Container(
                        //color:Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 25.0),

                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/third');
                          },
                          padding: EdgeInsets.all(15.0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Color(0xFF527DAA),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),

//Dont have account
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/second');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an Account? ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
