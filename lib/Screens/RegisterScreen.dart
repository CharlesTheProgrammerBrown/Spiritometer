import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../UI/CustomInputField.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
 
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
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //SIGN IN AT TOP PAGE
                      Text(
                        'Sign Up',
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
                          height: 120,
                          width: double.infinity),
                      SizedBox(height: 10.0),

                      //INPUT FIELDS
                      //pass Icon,icon color & txt label & hint text to constructor
                      CustomInputField(Icon(Icons.person, color: Colors.white),
                          'First Name', 'Enter your Name'),
                      CustomInputField(Icon(Icons.person, color: Colors.white),
                          'Last Name', 'Enter your Last Name'),
                      CustomInputField(Icon(Icons.email, color: Colors.white),
                          'Email', 'Enter your Email'),
                      CustomInputField(Icon(Icons.lock, color: Colors.white),
                          'Password', 'Enter your Password'),
                      CustomInputField(Icon(Icons.lock, color: Colors.white),
                          'Confirm Password', 'Confirm Password'),

                           //Register button
                      Container(
                        //color:Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 25.0),

                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            //logs you in after registration
                            Navigator.of(context).pushNamed('/third');
                          },
                          padding: EdgeInsets.all(15.0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                color: Color(0xFF527DAA),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),

//Have account
                      GestureDetector(
                        onTap: () {
                          //goes to first page when tapped
                          Navigator.of(context).pushNamed('/');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Have an Account? ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400
                                    ),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
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
            ],
          ),
        ),
      ),
    );
  }
}