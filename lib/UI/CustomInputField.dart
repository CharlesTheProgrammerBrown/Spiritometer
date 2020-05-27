import 'package:flutter/material.dart';
import '../Utilities/constants.dart';

class CustomInputField extends StatelessWidget{

  final String hintTxt;
  final Icon icon;

  CustomInputField(this.icon, this.hintTxt);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: icon,
                          ),
                          Container(
                            //alignment: Alignment.centerRight,
                            decoration:uiBoxDecorationStyle, 
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: hintTxt,
                                    fillColor: Colors.white,
                                    filled: true),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              ),
                            ),
                          ),
                        ],
                      );
                      
                
  }
}