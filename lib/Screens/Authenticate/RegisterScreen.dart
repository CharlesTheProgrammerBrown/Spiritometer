import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spiritometer/Services/auth.dart';
//import 'package:spiritometer/UI/CustomInputField.dart';
import 'package:spiritometer/Shared/constants.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleViewResult;

  RegisterScreen({this.toggleViewResult});

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

//txt field state
  String name = '';
  String email = '';
  String password = '';
  String confirmPas = '';
  String error = '';

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
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
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

                      SizedBox(height: 5.0),

                      //LOGO
                      //needs to be loaded before, try init state
                      Image.asset(
                          'assets/images/logo_name_transparent copy.png',
                          height: 120,
                          width: double.infinity),
                      SizedBox(height: 1.0),

                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /*Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: icon,
                            ),*/

                            //Full Name Custom Field
                            Text('Full Name', style: uiLabelStyle),
                            SizedBox(height: 8),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: uiBoxDecorationStyle,
                              height: 50,
                              child: TextFormField(
                                //track what the user is typing
                                //func to take val of form field at that particular time

                                //if field empty return string help txt else null
                                validator: (val) =>
                                    val.isEmpty ? 'Enter Name' : null,

                                //track what the user is typing
                                onChanged: (val) {
                                  setState(() {
                                    name = val;
                                  });
                                },
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans'),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    hintText: 'Name Surname',
                                    hintStyle: uiHintTextStyle,
                                    //fillColor: Colors.white,
                                    //filled: true
                                    prefixIcon: Icon(Icons.person,
                                        color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),

                            // Email Custom field
                            Text('Email', style: uiLabelStyle),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: uiBoxDecorationStyle,
                              height: 50,
                              child: TextFormField(
                                //track what the user is typing
                                //func to take val of form field at that particular time

                                //if field empty return string help txt else null
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,

                                //track what the user is typing
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans'),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    hintText: 'Enter your Email',
                                    hintStyle: uiHintTextStyle,
                                    //fillColor: Colors.white,
                                    //filled: true
                                    prefixIcon:
                                        Icon(Icons.email, color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),

                            // Password Custom field
                            Text('Password', style: uiLabelStyle),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: uiBoxDecorationStyle,
                              height: 50,
                              child: TextFormField(
                                //track what the user is typing
                                //func to take val of form field at that particular time

                                //if field empty return string help txt else null
                                validator: (val) => val.length < 8
                                    ? 'Password must have at least 8 characters'
                                    : null,

                                //track what the user is typing
                                onChanged: (val) {
                                  setState(() {
                                    password = val;
                                  });
                                },
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans'),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    hintText: 'Enter your Password',
                                    hintStyle: uiHintTextStyle,
                                    //fillColor: Colors.white,
                                    //filled: true
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),

                            // Confirm Password Custom field
                            Text('Confirm Password', style: uiLabelStyle),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: uiBoxDecorationStyle,
                              height: 50,
                              child: TextFormField(
                                //track what the user is typing
                                //func to take val of form field at that particular time

                                //if field empty return string help txt else null
                                validator: (val) => val == password
                                    ? null
                                    : 'Passwords do not match',
                                onChanged: (val) {
                                  setState(() {
                                    confirmPas = val;
                                    /*   check if confirmPass is same as password
                                         if (confirmPas == password) {}
                                    */
                                  });
                                },
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans'),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    hintText: 'Confirm your Password',
                                    hintStyle: uiHintTextStyle,
                                    //fillColor: Colors.white,
                                    //filled: true
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            )
                          ],
                        ),
                      ),

                      /*                CUSTOM INPUT FIELDS CLASS

                      //pass Icon,icon color & txt label & hint text to constructor

                      CustomInputField(Icon(Icons.person, color: Colors.white),
                          'Name', 'Name Surname',false),
                      CustomInputField(Icon(Icons.email, color: Colors.white),
                          'Email', 'Enter your Email',false),
                      CustomInputField(Icon(Icons.lock, color: Colors.white),
                          'Password', 'Enter your Password',true),
                      CustomInputField(Icon(Icons.lock, color: Colors.white),
                          'Confirm Password', 'Confirm Password',true),
                */

                      //Register button
                      Container(
                        //color:Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 20.0),

                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () async {
                            /*logs you in after registration
                            Navigator.of(context).pushNamed('/third'); */
                            if (_formKey.currentState.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'An error occurred while registering.';
                                });
                              }
                            }
                          },
                          padding: EdgeInsets.all(15.0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Color(0xFF527DAA),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),

//Have account
                      GestureDetector(
                        onTap: () {
                          //goes to first page when tapped
                          // Navigator.of(context).pushNamed('/');
//toggles to the opposite state- login
                          widget.toggleViewResult();
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Have an Account? ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
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
