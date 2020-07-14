import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:spiritometer/audio_file_picker.dart';

class TimeModel{
  String title;
  int time;

  TimeModel({this.title, this.time});
}

class PrayNow extends StatefulWidget {
  @override
  _PrayNowState createState() => _PrayNowState();
}

class _PrayNowState extends State<PrayNow> {
  var chosenTime;
   final times = [
      TimeModel(
        title: '1 min',
        time: 60,),
     TimeModel(
        title: '5 mins',
        time: 300,),
     TimeModel(
        title: '10 mins',
        time: 600,),
    TimeModel(
        title: '15 mins',
        time: 900,),
    TimeModel(
         title: '30 mins',
        time: 1800,),
    TimeModel(
         title: '45 mins',
        time: 2700,),
    TimeModel(
        title: '60 mins',
        time: 3600,),
  ];

  int selectedIndex1 = 0;

  List<Widget> _buildItems1() {
    return times
        .map((val) => MySelectionItem(
              title: val.title,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.8,

        //height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Row(children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, right: 0),
                    child: IconButton(
                        icon: Icon(Icons.cancel, color: Colors.red, size: 30.0),
                        onPressed: () => Navigator.of(context).pop()),
                  )
                ]),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        //padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                        child: Text(
                          "PRAYER TIME!",
                          style: TextStyle(
                              letterSpacing: 2.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                        child: Text(
                          "Duration",
                          style: TextStyle(
                              color: Colors.white,
                              //fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                      ),
                      DirectSelect(
                        itemExtent: 50.0,
                        selectedIndex: selectedIndex1,
                        backgroundColor: Colors.blueAccent,
                        child: MySelectionItem(
                          isForList: false,
                          title: times[selectedIndex1].title,
                        ),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedIndex1 = index;
                          });
                        },
                        items: _buildItems1(),
                      ),
                      SizedBox(height: 20),
                      AudioFilePicker(times[selectedIndex1].time),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: isForList
          ? Padding(
              child: _buildItem(context, isForList),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 5.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context, isForList),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down, color: Colors.black),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context, bool isForList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        title,
        style: (isForList)
            ? TextStyle(
                color: Colors.white,
              )
            : TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }

/*_buildItem2(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title, style: TextStyle(color: Colors.black)),
    );
  }*/
}
