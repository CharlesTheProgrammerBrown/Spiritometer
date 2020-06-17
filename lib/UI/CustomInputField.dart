import 'package:flutter/material.dart';
import '../Utilities/constants.dart';

class CustomInputField extends StatelessWidget {
  final String hintTxt;
  final String labelTxt;
  final Icon icon;
  final bool obscureTxt;
 

  CustomInputField(this.icon, this.labelTxt, this.hintTxt,this.obscureTxt);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: icon,
                          ),*/
        Text(labelTxt,style: uiLabelStyle,),
        SizedBox(height:10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: uiBoxDecorationStyle,
          height: 50,

          child: TextField(
            //track what the user is typing 
            onChanged: (val){
              

            },
            obscureText: obscureTxt,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white,
             fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top:14.0),
                hintText: hintTxt,
               hintStyle: uiHintTextStyle,
                //fillColor: Colors.white,
                //filled: true
                prefixIcon: icon
                ),
          ),
        ),SizedBox(height: 10,)
        ,
      ],
    );
  }
}
