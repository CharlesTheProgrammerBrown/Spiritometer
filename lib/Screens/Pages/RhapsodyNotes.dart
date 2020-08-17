import 'package:flutter/material.dart';

class RhapsodyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(top: 17.0),
            child: BackButton(),
          ),
          backgroundColor: Color(0xFF8f94fb),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 17.0),
            child: Text(
              "Rhapsody Notes",
              style: TextStyle(
                  letterSpacing: 1,
                  fontFamily: "OpenSans",
                  color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("No notes added"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
