import 'package:flutter/material.dart';
import 'package:spiritometer/Screens/Pages/RhapsodyMenu.dart';
import 'package:spiritometer/Screens/Pages/RhapsodyNotes.dart';
import 'package:spiritometer/Shared/constants.dart';

class RhapsodyNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              RhapsodyMenu(),
              RhapsodyNotes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF59c173),
            Color(0xFF8f94fb),
            Color(0xFFa17fe0),
          ],
          /* begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5, 0.9],*/
        ),
      ),
      // color: Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        labelStyle: uiLabelStyle,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.white,
        tabs: [
          Tab(
            text: "Calendar",
            icon: Icon(Icons.calendar_today),
          ),
          Tab(
            text: "Notes",
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
    );
  }
}
