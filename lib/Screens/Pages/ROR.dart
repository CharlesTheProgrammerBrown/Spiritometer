import 'package:flutter/material.dart';
import 'package:spiritometer/UI/MenuUI.dart';

class RoR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    child: IconButton(
                        icon: Icon(Icons.settings, color: Colors.white),
                        onPressed: null ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset('assets/images/Pst_Chris.jpg',
                      fit: BoxFit.cover),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height:40.0),
                ListTile(
                  title: Center(
                    
                      child:
                          Text('CHARLES BROWN', style: TextStyle(fontSize: 20, backgroundColor: Colors.blueGrey[100])),
                    
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
                backgroundImage: AssetImage('assets/images/CHARLES_BROWN.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
