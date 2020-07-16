import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Pages/PrayNow.dart';

class Menu extends StatefulWidget {
  final titles = ['PRAYER', 'RHAPSODY OF REALITIES', 'BIBLE STUDY', 'SCHEDULER'];
  final icons = [
    Icons.watch_later,
    Icons.library_books,
    Icons.book,
    Icons.calendar_today];

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget>[
        Card(
          elevation: 5.0,
          color: Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
          margin:EdgeInsets.all(6.0),
          child: ListTile(
            onTap:(){ 
             prayNowBottomSheetModal(context);
            
            },
            contentPadding:EdgeInsets.only(left:90,right: 30),
            leading: Icon(widget.icons[1],color: Colors.white),
            title: Text(widget.titles[1],style: TextStyle( fontSize: 20, color: Colors.white),
            ),
          ),
          ),

         Card(
          elevation: 5.0,
          color: Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
          margin:EdgeInsets.all(6.0),
          child: ListTile(
            onTap:(){ },
            contentPadding:EdgeInsets.only(left:90,right: 30),
            leading: Icon(widget.icons[2],color: Colors.white),
            title: Text(widget.titles[2],style: TextStyle( fontSize: 20, color: Colors.white),
            ),
          ),
          ),

          Card(
          elevation: 5.0,
          color: Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
          margin:EdgeInsets.all(6.0),
          child: ListTile(
            onTap:(){ },
            contentPadding:EdgeInsets.only(left:90,right: 30),
            leading: Icon(widget.icons[3],color: Colors.white),
            title: Text(widget.titles[3],style: TextStyle( fontSize: 20, color: Colors.white),
            ),
          ),
          ), 
      ]
    
      
    );
  }

  void prayNowBottomSheetModal(context){
    showModalBottomSheet(context: context, builder:(_)=>PrayNow(), isScrollControlled:true);
  }
  
}