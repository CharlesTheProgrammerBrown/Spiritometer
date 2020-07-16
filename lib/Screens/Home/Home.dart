import 'package:flutter/material.dart';
import 'package:spiritometer/Services/auth.dart';
import 'package:spiritometer/UI/MenuUI.dart';

class Home extends StatelessWidget {
  // MainPage();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height / 3,
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: FlatButton.icon(
                            label: Text(
                              'Sign Out',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              await _auth.signOut();
                            }),
                      )
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset('assets/images/Pst_Chris.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(height: 40.0),
                    ListTile(
                      title: Center(
                        child: Text('CHARLES BROWN',
                            style: TextStyle(
                                fontSize: 20,
                                backgroundColor: Colors.blueGrey[100])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MenuLayout(),
                    ),
                  ]))
                ],
              ),
              Positioned(
                top: 115,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor:
                      Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
                  child: CircleAvatar(
                    radius: 72,
                    backgroundImage:
                        AssetImage('assets/images/CHARLES_BROWN.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
