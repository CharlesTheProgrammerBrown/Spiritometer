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
  DateTime _eventDate;
  final _formKey = GlobalKey<FormState>();
 

  bool showProgressIndicator = true;
  bool processing;

  @override
  void initState() {
    super.initState();

processing = false;
_eventDate = DateTime.now();
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
              return  Column(
                    
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
                      SizedBox(height: 10),

                      Form(
                        key: _formKey,
                                              child: Container(
                          alignment: Alignment.center,
                          child: ListView(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            shrinkWrap: true,
                            children: <Widget>[
                               Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                    child: TextFormField(
                                      controller: titleController,
                                      validator: (value) =>
                                  (value.isEmpty) ? "Please Enter title" : null,
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
                                
                              
                               Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                  child: TextFormField(
                                    controller: noteController,
                                    validator: (value) =>
                            (value.isEmpty) ? "Please Enter Note" : null,
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
                              
 const SizedBox(height: 10.0),
              ListTile(
                title: Text("Date (YYYY-MM-DD)"),
                subtitle: Text("${_eventDate.year} - ${_eventDate.month} - ${_eventDate.day}"),
                onTap: ()async{
                  DateTime picked = await showDatePicker(context: context, initialDate: _eventDate, firstDate: DateTime(_eventDate.year-5), lastDate: DateTime(_eventDate.year+5));
                  if(picked != null) {
                    setState(() {
                          _eventDate = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 10.0),
              processing
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              
                                child: FlatButton.icon(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  color: Colors.blue[400],
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      processing = true;
                                      await _firebaseUserRhapsodyDataRepository
                                          .addUserRhapsodyData(
                                        UserRhapsodyModel(
                                          title: titleController.text,
                                          note: noteController.text,
                                          eventDate: _eventDate

                                        ),
                                      );
                                    
                                         
                                          Navigator.pop(context);
                                  setState(() {
                                    processing = false;
                                 
                                                                  });
                                                                        
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
                        ),
                      ),
                                                    ],
                                                  
                                                
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
                                
                               
