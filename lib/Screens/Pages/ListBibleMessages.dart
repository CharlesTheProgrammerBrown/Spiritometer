import 'package:flutter/material.dart';
import 'package:spiritometer/Shared/constants.dart';

class ListBibleMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(top: 17.0),
            child: BackButton(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xFF8f94fb),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 17.0),
            child: Text(
              "Inspirational Messages",
              style: headerTextStyle,
            ),
          ),
        ),
        body: Container(
          
          height: MediaQuery.of(context).size.height,
          
          child: ListView(
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.expand_more, color: Colors.black,),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/RhapsodyBibleLogo.jpg"),
                ),
                title: Text("Recreate Your World With Your Words",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                subtitle: Text(
                  "Genesis 1:2-3",
                  style: TextStyle(
                    fontFamily: "CentraleSansRegular",
                    fontSize: 16,
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