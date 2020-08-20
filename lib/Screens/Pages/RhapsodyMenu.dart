import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:spiritometer/RhapsodyBloc/rhapsody_bloc.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RhapsodyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
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
                      return CalendarCarouselLoaded(
                        model: state.userRhapsodyModel,
                        dates: state.markedDateMap,
                      );
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

class CalendarCarouselLoaded extends StatelessWidget {
  final List<UserRhapsodyModel> model;
  final EventList<Event> dates;

  const CalendarCarouselLoaded({Key key, this.model, this.dates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: CalendarCarousel<Event>(
            onDayPressed: null,
            /*(DateTime date, List<Event> events) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RhapsodyRecord(),
            ),
          );
        }*/
            weekendTextStyle: TextStyle(
              color: Colors.red,
            ),
            thisMonthDayBorderColor: Colors.transparent,

//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
/*
        customDayBuilder: (
          /// you can provide your own build function
          /// to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
/// If you return null, [CalendarCarousel] will build container for current [day]
/// with default function.
/// This way you can build custom containers for specific days only, leaving rest
///  as default.
// Example: every 15th of month, we have a flight, we can place an icon in the
/// container like that:
          if (day.day == DateTime.sunday) {
            return Center(
              child: Icon(Icons.hotel),
            );
            }else {
              return null;
            }

        },*/
            weekFormat: true,
            markedDatesMap: dates,
            height: 250,
            selectedDateTime: DateTime.now(),

            daysHaveCircularBorder: true,
          ),
        ),
        RhapsodyCreateMessage()
      ],
    );
  }
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
