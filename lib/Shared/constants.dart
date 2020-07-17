import 'package:flutter/material.dart';

final uiHintTextStyle =
    TextStyle(color: Colors.white70, fontFamily: 'OpenSans', fontSize: 15);

final uiLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    fontFamily: 'OpenSans');

final uiBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

//EXIT POP UP WINDOW STYLES
final uiPopUpBtnStyle = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    fontFamily: 'OpenSans');

final uiPopUpContentStyle = TextStyle(
 fontSize: 18,
 fontFamily: 'OpenSans');

 final uiHomeContentStyle = TextStyle(
 fontSize: 15,
 letterSpacing: 2.0,
 fontWeight: FontWeight.bold,
 fontFamily: 'OpenSans');

final uiTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    fontFamily: 'OpenSans');

final boxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: <Color>[Color(0xff59c173), Color(0xffa17fe0)],
  ),
);
