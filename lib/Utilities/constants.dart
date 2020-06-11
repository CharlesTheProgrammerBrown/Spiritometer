import 'package:flutter/material.dart';

final uiHintTextStyle = TextStyle(
  color:Colors.white60,
  fontFamily:'OpenSans',
);

final uiLabelStyle = TextStyle(
  color:Colors.white,
  fontWeight:FontWeight.bold,
  fontFamily:'OpenSans'
);

final uiBoxDecorationStyle = BoxDecoration(
  color:Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [BoxShadow(
    color:Colors.black,
    blurRadius: 6.0,
    offset:Offset(0,2),
  ),
  ],
);