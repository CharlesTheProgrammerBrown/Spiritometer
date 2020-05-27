import 'package:flutter/material.dart';

class MenuLayout extends StatelessWidget {
  final titles = ['PRAYER', 'RHAPSODY OF REALITIES', 'BIBLE STUDY', 'SCHEDULER'];
  final icons = [
    Icons.watch_later,
    Icons.library_books,
    Icons.book,
    Icons.timer
  ];

MenuLayout(){
  print('working');
}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          color: Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
          margin:EdgeInsets.all(6.0),
          child: ListTile(
            contentPadding:EdgeInsets.only(left:90,right: 30),
            leading: Icon(icons[index],color: Colors.white),
            title: Text(titles[index],style: TextStyle( fontSize: 20, color: Colors.white),),
            
          ),
        );
      },
    );
  }
}


