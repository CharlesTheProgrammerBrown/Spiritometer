import 'package:flutter/material.dart';
import 'package:spiritometer/Shared/constants.dart';

class RorRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data:
          Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.grey[400]),
      child: Scaffold(
        body: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Row(
                        children: [
                          BackButton(color: Colors.black45),
                        ],
                      ),
                    ),

                    //2nd element
                    Center(
                      child: Text(
                        'RHAPSODY',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            letterSpacing: 1,
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.deepPurple),
                      ),
                    ),
                    SizedBox(height: 15),

                    ListView(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          // color:Colors.white,
                          margin: EdgeInsets.all(14),
                          decoration: roRBoxDecorationStyle,
                          height: 35,
                          width: double.infinity,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 15.0),
                              child: TextFormField(
                                onTap: (){},
                                cursorColor: Colors.black,
                                style: rorRecordTextStyle,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  hintText: 'Add Title',
                                  hintStyle: rorRecordTextStyle,
                                  //fillColor: Colors.white,
                                  //filled: true
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Spacer(),
                        Container(
                          // color:Colors.white,
                          margin: EdgeInsets.all(14),
                          decoration: roRBoxDecorationStyle,
                          height: 400,
                          width: double.infinity,

                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                            ),
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.top,
                              cursorColor: Colors.black,
                              style: rorRecordTextStyle,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                hintText: 'Note',
                                hintStyle: rorRecordTextStyle,
                              ),
                            ),
                          ),
                        ),

                         Center(
                            child: FlatButton.icon(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              color: Colors.blue[400],
                              onPressed: () {},
                              icon: Icon(Icons.save, size: 15),
                              label: Text('Save'),
                            ),
                          ),
                        
                      ],
                    ),
                  ],
                )
              ),
            
          ),
    );
  }
}
