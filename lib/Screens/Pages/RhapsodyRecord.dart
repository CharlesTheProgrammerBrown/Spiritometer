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
  
  final _formKey = GlobalKey<FormState>();

  bool showProgressIndicator = true;
  bool processing;

  @override
  void initState() {
    super.initState();

    processing = false;
  
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
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: BackButton(
            color: Colors.white,
          ),
          title: Text(
            'RHAPSODY STUDY NOTES',
            style: headerTextStyle,

            // decorationColor: Colors.deepPurple),
          ),
        ),
//          backgroundColor: Color(0xFF8f94fb),

        body: Builder(
          builder: (context) {
            return Column(
              children: [
                //2nd element
                Form(
                  key: _formKey,
                  child: Expanded(
                    //alignment: Alignment.center,
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      shrinkWrap: true,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 40.0),
                          child: Container(
                            color: Colors.white,
                            child: TextFormField(
                              controller: titleController,
                              validator: (value) =>
                                  (value.isEmpty) ? "Please Enter title" : null,
                              textCapitalization: TextCapitalization.characters,
                              autofocus: true,
                              autocorrect: true,
                              onTap: () {},
                              maxLines: 1,
                              cursorColor: Colors.black,
                              style: rorRecordTextStyle,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 10.0, left: 10.0),
                                //hintText: 'Add Title',
                                labelText: "Title",
                                hintStyle: rorRecordTextStyle,
                                //fillColor: Colors.white,
                                //filled: true
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 15.0),
                          child: Container(
                            color: Colors.white,
                            child: TextFormField(
                              autocorrect: true,
                              controller: noteController,
                              validator: (value) =>
                                  (value.isEmpty) ? "Please Enter Note" : null,
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.multiline,
                              textAlignVertical: TextAlignVertical.top,
                              cursorColor: Colors.black,
                              style: rorRecordTextStyle,
                              textInputAction: TextInputAction.newline,
                              minLines: 7,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 10.0, left: 10.0),
                                //hintText: 'Note',
                                hintStyle: rorRecordTextStyle,
                                labelText: "NOTES",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        
                        processing
                            ? Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 20),
                                child: FlatButton.icon(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23.0),
                                  ),
                                  color: Colors.amberAccent,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                     setState(() {
                                        processing = true;
                                      });
                                      await _firebaseUserRhapsodyDataRepository
                                          .addUserRhapsodyData(
                                        UserRhapsodyModel(
                                            title: titleController.text,
                                            note: noteController.text,
                                            eventDate: DateTime.now()),
                                      ).then((value){
 Navigator.pop(context);
                                      setState(() {
                                        Future.delayed(Duration(seconds: 4)).then((value) =>  processing = false);
                                      });
                                      Navigator.pop(context);
                                    }).catchError((e){
Navigator.pushNamed(context, '/errorPage');
                                    });
                                      

                             
                                    }
                                     
                                  },
                                  icon: Icon(
                                    Icons.save,
                                    size: 17,
                                  ),
                                  label: Text(
                                    'Save',
                                    style: TextStyle(fontSize: 17),
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
      onWillPop: () => onWillPop(
        contextB,
      ),
    );
  }
}
