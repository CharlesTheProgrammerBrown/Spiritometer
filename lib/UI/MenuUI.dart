import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Authenticate/RegisterScreen.dart';
import 'package:spiritometer/Screens/Pages/PrayNow.dart';
import 'package:spiritometer/Screens/Pages/ROR.dart';

class MenuModel {
  String title;
  Icon icon;
  String route;
  dynamic funcName;

  MenuModel({this.title, this.icon, this.funcName});
}

class MenuLayout extends StatelessWidget {
  final items = [
    MenuModel(
        icon: Icon(Icons.watch_later, color: Colors.white),
        title: 'PRAY NOW',
        funcName: PrayNow()),
    MenuModel(
        icon: Icon(Icons.library_books, color: Colors.white),
        title: 'RHAPSODY OF REALITIES',
        funcName: RoR()),
    MenuModel(
        icon: Icon(Icons.book, color: Colors.white),
        title: 'BIBLE STUDY',
        funcName: PrayNow()),
    MenuModel(
        icon: Icon(Icons.calendar_today, color: Colors.white),
        title: 'SCHEDULE',
        funcName: PrayNow())
  ];

  MenuLayout() {
    //print('working');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          color: Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
          margin: EdgeInsets.all(6.0),
          child: ListTile(
            onTap: () {
              prayNowBottomSheetModal(context, items[index].funcName);
            },
            contentPadding: EdgeInsets.only(left: 70, right: 30),
            leading: items[index].icon,
            title: Text(
              items[index].title,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void prayNowBottomSheetModal(context, funcName) {
    showModalBottomSheet(
        context: context,
        builder: (_) => funcName,
        isScrollControlled: true,
        enableDrag: false);
    //Navigator.of(context).pushNamed(items[index].route);
  }
}
