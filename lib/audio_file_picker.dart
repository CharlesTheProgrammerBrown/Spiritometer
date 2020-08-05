import 'dart:io';
import 'package:file_picker/file_picker.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spiritometer/UI/CountDownTimer.dart';

class AudioFilePicker extends StatefulWidget {
  final time;
  AudioFilePicker(this.time);

  @override
  _AudioFilePickerState createState() => _AudioFilePickerState();
}

class _AudioFilePickerState extends State<AudioFilePicker> {
  List<File> pathFiles;
  bool fileAdded = false;
  String btnLabel = 'Add Music';

  @override
  void dispose() {
    pathFiles.clear();
    print('paths cleared');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
      btnLabel = fileAdded?"Songs Added":"Add Music";
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton.icon(
            onPressed: () async {
              pathFiles = await FilePicker.getMultiFile(type: FileType.audio);

              setState(() {
                fileAdded = pathFiles.isNotEmpty;
              });

              //playAudioFromLocalStorage(path);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                vertical: 13.0,
                horizontal: MediaQuery.of(context).size.width * 0.345),
            elevation: 5.0,
            //textColor: Colors.black,
            label: Expanded(
              child: Text(btnLabel,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
            icon: Icon(Icons.playlist_add),
          ),
        ),
        SizedBox(height: 20),

        //START BUTTON

        RaisedButton(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          disabledColor: Colors.white54,
          onPressed: fileAdded
              ? () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              CountDownTimer(widget.time, pathFiles)));

                  setState(() {
                    fileAdded = false;
                  });
                }
              : null,
          child: Text('Set',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
        )
      ],
    );
  }
}
