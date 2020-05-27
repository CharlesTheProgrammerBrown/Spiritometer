import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../UI/CustomInputField.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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
                    padding: EdgeInsets.symmetric(
                      horizontal:40.0,
                      vertical:120.0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Sign In', style:TextStyle(color:Colors.white,fontFamily:'OpenSans', fontSize:30.0,fontWeight:FontWeight.bold),
                            ),
                            SizedBox(height:20.0),
                        Image.asset('images/logo_name_transparent copy.png',
                            height: 180, width: 200),
                            SizedBox(height:10.0),
                            
                        CustomInputField(
                            Icon(Icons.email, color: Colors.black), 'Email'),
                        CustomInputField(
                            Icon(Icons.lock, color: Colors.black), 'Password'),
                        Container(
                          //color:Colors.blue,
                          padding: EdgeInsets.only(top: 5.0),
                          width: 120,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/second');
                            },
                            color: Colors.deepPurple[300],
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.grey[50], fontSize: 18),
                            ),
                          ),
                        )
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
