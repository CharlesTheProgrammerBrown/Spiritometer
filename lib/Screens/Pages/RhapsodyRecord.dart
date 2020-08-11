import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:spiritometer/Shared/constants.dart';
import 'package:spiritometer/models/userRhapsodyModel/FirebaseUserRhapsodyDataRepository.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyRepository.dart';

class RhapsodyRecord extends StatefulWidget {
  @override
  _RhapsodyRecordState createState() => _RhapsodyRecordState();
}

class _RhapsodyRecordState extends State<RhapsodyRecord> {
  //get context => null;

  final UserRhapsodyRepository _firebaseUserRhapsodyDataRepository =
      FirebaseUserRhapsodyDataRepository();
  String title = '';
  String note = '';
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  bool showProgressIndicator = true;

  @override
  void initState() {
    super.initState();

    titleController.addListener(_updateTitleValue);
    noteController.addListener(_updateNoteValue);
  }

  _updateTitleValue() {
    title = titleController.text;
    print(title);
  }

  _updateNoteValue() {
    note = noteController.text;
    print(note);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop(BuildContext context) async {
    return (showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text(
              'Exiting without Saving',
              style: uiPopUpContentStyle,
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: uiPopUpBtnStyle,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes', style: uiPopUpBtnStyle),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext contextB) {
    return WillPopScope(
      child: Theme(
        data: Theme.of(contextB)
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        child: Scaffold(
          body: Builder(
            builder: (context) {
              return Container(
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
                                controller: titleController,
                                textCapitalization:
                                    TextCapitalization.characters,
                                autofocus: true,
                                autocorrect: true,
                                onTap: () {},
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
                              controller: noteController,
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.multiline,
                              textAlignVertical: TextAlignVertical.top,
                              cursorColor: Colors.black,
                              style: rorRecordTextStyle,
                              textInputAction: TextInputAction.newline,
                              maxLines: null,
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
                            onPressed: () async {
                              if (titleController.text.isEmpty ||
                                  noteController.text.isEmpty) {
                                Flushbar(
                                  titleText: Text(
                                    "Hey KingPriest",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "Slab",
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  messageText: Text(
                                    "Missing Field(s)!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 19.0,
                                      color: Colors.white,
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  backgroundGradient: LinearGradient(
                                    colors: [
                                      Color(0xFF59c173),
                                      Color(0xFF8f94fb),
                                      Color(0xFFa17fe0),
                                    ],
                                  ),
                                  duration: Duration(
                                    seconds: 4,
                                  ),
                                )..show(context);
                              } else {
                                showProgressIndicator
                                    ? Flushbar(
                                        title: "Please Wait",
                                        messageText: Text(
                                          "Saving In Progress!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "Slab",
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        showProgressIndicator: true,
                                        progressIndicatorBackgroundColor:
                                            Colors.amber,
                                        backgroundColor: Colors.black,
                                        duration: Duration(
                                    seconds: 7,
                                  ),
                                      ).show(context)
                                    : Container();
                                   
                                await _firebaseUserRhapsodyDataRepository
                                    .addUserRhapsodyData(
                                  UserRhapsodyModel(
                                    title: title,
                                    note: note,
                                  ),
                                )
                                    .then(
                                  (value) {
                                    Flushbar(
                                      
                                      titleText: Text(
                                        "Congrats KingPriest!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      messageText: Text(
                                        "Your Article notes were saved successfully.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "Slab",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      duration: Duration(
                                        seconds: 5,
                                      ),
                                      backgroundColor: Colors.green,
                                    ).show(context);
                                    
                                  },
                                ).catchError(
                                  (onError) {
                                    Flushbar(
                                      title: "Sorry KingPriest",
                                      messageText: Text(
                                        "Could not save article notes!",
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: Duration(
                                        seconds: 4,
                                      ),
                                    ).show(context);
                                  },
                                );
                              }
                            },
                            icon: Icon(
                              Icons.save,
                              size: 15,
                            ),
                            label: Text(
                              'Save',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      onWillPop: () => onWillPop(
        contextB,
      ),
    );
  }
}
