import 'package:flutter/material.dart';
import '../UI/MenuUI.dart';

class MainPage extends StatelessWidget {
  // MainPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Image(
                  image: AssetImage('images/Pst_Chris.jpg'),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
              Positioned(
                bottom: -70,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
                  child: CircleAvatar(
                    radius: 72,
                    backgroundImage: AssetImage('images/CHARLES BROWN.jpg'),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:75.0),
                  child: Text(
                    'CHARLES BROWN',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
         
          // FlatButton.icon(onPressed: null, icon: null, label: Text('Rhapsody'),)
         Expanded(child: MenuLayout() ) 
        ],
      ),
    );
  }
}