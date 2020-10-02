import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BibleMenu extends StatefulWidget {
  @override
  _BibleMenuState createState() => _BibleMenuState();
}

class _BibleMenuState extends State<BibleMenu> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.green[300],
      ),
      child: Scaffold(
        body: Column(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  BibleMessageDisplay(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF59c173),
                          Color(0xFF8f94fb),
                          Color(0xFFa17fe0),
                        ],
                        begin: Alignment(-1, -1),
                        end: Alignment(2, 2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 30,
                    right: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            LineAwesomeIcons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Explore",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontFamily: 'CentraleSansRegular'),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Inspiring Messages",
                              style: TextStyle(
                                  color: Colors.grey[100],
                                  fontSize: 25,
                                  fontFamily: 'CentraleSansRegular',
                                  fontWeight: FontWeight.w200),
                            ),
                            Text(
                              "View All",
                              style: TextStyle(
                                  color: Colors.grey[100],
                                  fontSize: 20,
                                  fontFamily: 'CentraleSansRegular',
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.25,
                        horizontal: MediaQuery.of(context).size.width * 0.10),
                    height: 200,
                    width: 450,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Card(
                            elevation: 3.0,
                            child: InkWell(
                              splashColor: Colors.purple,
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/old-testament.jpg"),
                                height: 175,
                                width: 150,
                              ),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 3.0),
                            color: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          SizedBox(width: 20),
                          Card(
                            elevation: 3.0,
                            child: InkWell(
                              splashColor: Colors.purple,
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/new-testament.jpg"),
                                height: 175,
                                width: 150,
                              ),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 3.0),
                            color: Colors.yellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ]),
                  ),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BibleMessageDisplay extends StatelessWidget {
  const BibleMessageDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.55,
                        child: Container(
          
          height: MediaQuery.of(context).size.height * 0.5,
          width: 400,
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
    );
  }
}
