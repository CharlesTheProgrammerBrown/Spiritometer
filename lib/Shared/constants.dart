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

final uiPopUpContentStyle = TextStyle(fontSize: 18, fontFamily: 'OpenSans');

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
    colors: <Color>[
      Color(0xFF59c173),
      Color(0xFF8f94fb),
      Color(0xFFa17fe0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.5, 0.7],
  ),
);

final rorRecordTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'OpenSans',
  fontSize: 17,
  letterSpacing: 2,
);

final roRBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.horizontal(left: Radius.zero, right: Radius.zero),
);

final roRNoteDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(14.0),
);

final headerTextStyle =
    TextStyle(letterSpacing: 1, fontFamily: "OpenSans", color: Colors.white);
