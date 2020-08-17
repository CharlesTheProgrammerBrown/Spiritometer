import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Pages/PrayNow.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:spiritometer/Screens/Pages/RhapsodyNavigation.dart';
import 'package:spiritometer/Shared/constants.dart';

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
        funcName: RhapsodyNavigation()), //RhapsodyMenu()),
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
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: OutlineGradientButton(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              elevation: 0.0,
              child: Container(
                child: Text(
                  items[index].title,
                  textAlign: TextAlign.center,
                  style: uiHomeContentStyle,
                ),
                color: Colors.transparent,
              ),
              onTap: () {
                prayNowBottomSheetModal(context, items[index].funcName);
              },
              gradient: LinearGradient(
                colors: [
                  Color(0xFF59c173),
                  Color(0xFF8f94fb),
                  Color(0xFFa17fe0),
                ],
              ),
              radius: Radius.circular(30),
              strokeWidth: 5),
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
