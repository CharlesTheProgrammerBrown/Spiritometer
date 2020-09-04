import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spiritometer/RhapsodyBloc/rhapsody_bloc.dart';
import 'package:spiritometer/Shared/constants.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class RhapsodyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      floatingActionButton:
          BlocBuilder<RhapsodyBloc, RhapsodyState>(builder: (context, state) {
        if (state is RhapsodyLoaded) {
          // ignore: missing_return
          return FloatingActionButton(
              backgroundColor: Colors.orange,
              child: Icon(Icons.add),
              onPressed: () {
                
                final result =
                    eventDisplay(DateTime.now(), state.userRhapsodyModel);

                   
                result.isEmpty
                    ? Navigator.pushNamed(context, '/rhapsodyRecord')
                    : { Flushbar(
      
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [BoxShadow(color: Colors.blue[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)],
      backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: true,
      duration: Duration(seconds: 5),
      icon: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Rhapsody Note Limit",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text(
        "One article per day. Delete or Edit today's article in Notes Section!",
        style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
      ),
          )..show(context)};
              });
        } else
          return Container();
      }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: BackButton(color: Colors.white),
        ),
        backgroundColor: Color(0xFF8f94fb),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Text(
            "Rhapsody Calendar",
            style: headerTextStyle,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // decoration: boxDecoration,
          color: Colors.white54,
          child: SingleChildScrollView(
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
                        return (Calendar(
                            userRhapsodyModel: state.userRhapsodyModel,
                            markedDateMap: state.markedDateMap));
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

class Calendar extends StatefulWidget {
  final List<UserRhapsodyModel> userRhapsodyModel;
  final Map<DateTime, List<dynamic>> markedDateMap;

  Calendar({this.userRhapsodyModel, this.markedDateMap});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    // selectedDate = {};
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TableCalendar(
          calendarController: _calendarController,
          events: widget.markedDateMap,
          initialCalendarFormat: CalendarFormat.week,
          availableCalendarFormats: const {
            CalendarFormat.week: 'Week',
            CalendarFormat.twoWeeks: 'twoWeeks',
          },
          calendarStyle: CalendarStyle(
            canEventMarkersOverflow: true,
            todayColor: Colors.orange,
            selectedColor: Theme.of(context).primaryColor,
            todayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white),
          ),
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            formatButtonDecoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20.0),
            ),
            formatButtonTextStyle: TextStyle(color: Colors.white),
            formatButtonShowsNext: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.sunday,
          onDaySelected: (date, events) {
            setState(() {
              selectedDate = date;
              //eventDisplay(selectedDate, widget.userRhapsodyModel);
            });
          },
          builders: CalendarBuilders(
            selectedDayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
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
        SizedBox(height: 40),
        EventListDisplay(
            selectedDate: selectedDate, rhapsodyList: widget.userRhapsodyModel)
      ],
    );
  }
}

class EventListDisplay extends StatelessWidget {
  const EventListDisplay({
    Key key,
    this.selectedDate,
    this.rhapsodyList,
  }) : super(key: key);

  final DateTime selectedDate;
  final List<UserRhapsodyModel> rhapsodyList;

  @override
  Widget build(BuildContext context) {
    final filteredRhapsody = eventDisplay(selectedDate, rhapsodyList);
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: filteredRhapsody.length,
          itemBuilder: (BuildContext eventContext, int index) {
            return Card(
              elevation: 5.0,
              color: Color(0xFF8f94fb),
              child: ListTile(
                 leading: CircleAvatar(
  backgroundImage: AssetImage("assets/images/RhapsodyLogo.png"), // no matter how big it is, it won't overflow
),
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                title: Text(
                  "ROR TOPIC: ${filteredRhapsody[index].title.toUpperCase()}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Rhapsody Entry for ${dateFormat(selectedDate)}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

String dateFormat(DateTime date) {
  String dateInString = DateFormat('yyyy-MM-dd').format(date);
  return dateInString;
}

List<UserRhapsodyModel> eventDisplay(
    DateTime selectedDate, List<UserRhapsodyModel> listRhapsodies) {
  if (selectedDate == null) {
    return [];
  }
  return listRhapsodies
      .where(
        (rhapsody) => (rhapsody.eventDate?.day == selectedDate?.day &&
            rhapsody.eventDate?.year == selectedDate?.year &&
            rhapsody.eventDate?.month == selectedDate?.month),
      )
      .toList();
}
