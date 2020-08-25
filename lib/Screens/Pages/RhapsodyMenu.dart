import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spiritometer/RhapsodyBloc/rhapsody_bloc.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class RhapsodyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/rhapsodyRecord'),),
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
            "Rhapsody Calendar",
            style: TextStyle(
                letterSpacing: 1, fontFamily: "OpenSans", color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // decoration: boxDecoration,
          color: Colors.white54,
          child: Column(
            children: [
              Container(
                //decoration: boxDecoration,
                //color: Colors.blue,
                //margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: BlocBuilder<RhapsodyBloc, RhapsodyState>(
                  // ignore: missing_return
                  builder: (context, state) {
                    if (state is RhapsodyLoaded) {
                      return(Calendar(userRhapsodyModel:state.userRhapsodyModel, markedDateMap:state.markedDateMap));
                    } else if (state is RhapsodyLoading)
                      return calendarCarouselLoading(_height);
                    else
                      return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget calendarCarouselLoading(double height) {
  return Column(
    children: [
      SizedBox(height: height),
      Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.deepPurple,
          strokeWidth: 50.0,
        ),
      ),
    ],
  );
}



class RhapsodyCreateMessage extends StatelessWidget {
  const RhapsodyCreateMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                  child: Center(
                    child: Text(
                      'Welcome to the Rhapsody Study Tracker',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Icon(
                  LineAwesomeIcons.laugh_face_with_beaming_eyes,
                  color: Colors.blueAccent,
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Read today\'s Rhapsody of Realities?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "OpenSans"),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Create a Rhapsody Note Here',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 17),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              })
                      ]),
                ),
              ),
            ),
          ],
        ));
  }
}

class Calendar extends StatefulWidget {
final List<UserRhapsodyModel> userRhapsodyModel;
final Map<DateTime , dynamic> markedDateMap;

Calendar({this.userRhapsodyModel, this.markedDateMap});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;

  @override
  void initState() {
    
    super.initState();
    _calendarController = CalendarController();
  }

@override
  void dispose() {
     _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TableCalendar(
                        calendarController: _calendarController,
                        events:widget.markedDateMap ,
                        initialCalendarFormat: CalendarFormat.week,
                        availableCalendarFormats: const { CalendarFormat.twoWeeks : '2 weeks', CalendarFormat.week : 'Week'},
                        calendarStyle: CalendarStyle(
                            canEventMarkersOverflow: true,
                            todayColor: Colors.orange,
                            selectedColor: Theme.of(context).primaryColor,
                            todayStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white),),
                        headerStyle: HeaderStyle(
                          centerHeaderTitle: true,
                          formatButtonDecoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          formatButtonTextStyle: TextStyle(color: Colors.white),
                          formatButtonShowsNext: false,
                        ),
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        onDaySelected: (date, events) {
                          setState(() {
                            //_selectedEvents = events;
                          });
                        },
                        builders: CalendarBuilders(
                          selectedDayBuilder: (context, date, events) => Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: Colors.white),
                              )),
                          todayDayBuilder: (context, date, events) => Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                       
                      ),
 // ..._selectedEvents.map((event) => ListTile(
                  //       title: Text(event.title),
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (_) => EventDetailsPage(
                  //                       event: event,
                  //                     )));     
        
         
      ],
    );
                 
    
  }

}
    