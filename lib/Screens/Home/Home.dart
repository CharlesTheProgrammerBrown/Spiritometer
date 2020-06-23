import 'package:flutter/material.dart';
import 'package:spiritometer/Services/auth.dart';
import 'package:spiritometer/UI/MenuUI.dart';


class Home extends StatelessWidget {
  // MainPage();
final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        //backgroundColor: Colors.,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async
    {
      await _auth.signOut();
    }
          , icon: Icon(Icons.person), label: Text('Sign Out'))
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Image(
                  image: AssetImage('assets/images/pastor-chris.jpg'),
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  fit: BoxFit.cover),
              Positioned(
                bottom: -70,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xFF398AE5), //Colors.deepPurpleAccent[400],
                  child: CircleAvatar(
                    radius: 72,
                    backgroundImage: AssetImage('assets/images/CHARLES_BROWN.jpg'),
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