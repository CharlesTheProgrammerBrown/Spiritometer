import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import 'package:spiritometer/UI/MenuUI.dart';

class Home extends StatelessWidget {

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
                     automaticallyImplyLeading:false,
                    expandedHeight: MediaQuery.of(context).size.height / 3,
                    actions: <Widget>[
                      
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: FlatButton.icon(
                            label: Text(
                              'Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: ()  {
                              Navigator.pushNamed(context, '/profilePage');
                              //async
                              //await _auth.signOut();
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
                    SizedBox(height: 90.0),
                    
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: MenuLayout(),
                    ),
                  ]))
                ],
              ),
              Positioned(
                top: 115,
                child: OutlineGradientButton(
                  gradient: LinearGradient(colors: [
                    Color(0xFF59c173),
                    Color(0xFF8f94fb),
                    Color(0xFFa17fe0),
                  ], begin: Alignment(-1, -1), end: Alignment(2, 2)),
                  strokeWidth: 5,
                  padding: EdgeInsets.all(8),
                  radius: Radius.circular(90),
                  //Colors.deepPurpleAccent[400],
                  child: CircleAvatar(
                      radius: 78,
                      //height: 70,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'),
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
