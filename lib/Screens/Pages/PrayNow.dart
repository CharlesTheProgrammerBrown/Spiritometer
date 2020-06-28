import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';

class PrayNow extends StatefulWidget {
  final time = [
    "15 min",
    "30 mins",
    "45 mins",
    "60 mins",
  ];

  @override
  _PrayNowState createState() => _PrayNowState();
}

class _PrayNowState extends State<PrayNow> {

  int selectedIndex1 = 0;
  
List<Widget> _buildItems1() {
    return widget.time
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
        //height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: const EdgeInsets.only(top:8.0,left:8.0,right:4.0 ),
            child: Column(
              children: <Widget>[
                Row(children: [
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red),
                      onPressed: ()=>Navigator.of(context).pop()
                      )
                ]),
              
              Center(
                child:Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.stretch,
children:[
Center(
                  //padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                  child: Text(
                    " Its Prayer Time!",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500,fontSize:18.0 ),
                  ),
                ),

Padding(
                  padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                  child: Text(
                    "Duration",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500,fontSize:18.0 ),
                  ),
                ),
                
                DirectSelect(
                    itemExtent: 50.0,
                    selectedIndex: selectedIndex1,
                    backgroundColor: Colors.blue[900],
                    child: MySelectionItem(
                      isForList: false,
                      title: widget.time[selectedIndex1],
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex1 = index;
                      });
                    },
              items: _buildItems1(),
              ),
              ],
            
              ),
            ),
              ],
              )
            ),);
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
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
            shape:   RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)),
            elevation: 5.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }

}


