import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:spiritometer/Screens/Pages/rorRecord.dart';


class RoR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: true,
        right: true,
        bottom: true,
        top: true,
        child: Container(
          // decoration: boxDecoration,
          color: Colors.white54,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    BackButton(color: Colors.black),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        onPressed: null)
                  ],
                ),
              ),
              //SizedBox(height: 10),
              Container(
                //decoration: boxDecoration,
                //color: Colors.blue,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List<Event> events) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RorRecord(),
                      ),
                    );
                  },
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
                  weekFormat: false,
                  markedDatesMap: null,
                  height: 400,
                  selectedDateTime: DateTime.now(),
                  
                  daysHaveCircularBorder: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
