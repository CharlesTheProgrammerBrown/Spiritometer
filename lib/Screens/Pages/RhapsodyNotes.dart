import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spiritometer/RhapsodyBloc/rhapsody_bloc.dart';
import 'package:spiritometer/Screens/Pages/EditRhapsodyRecord.dart';
import 'package:spiritometer/Shared/constants.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';

class RhapsodyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
      IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            
          }),
    ],
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
              "Rhapsody Notes",
              style: headerTextStyle,
            ),
          ),
        ),
        body:BlocBuilder<RhapsodyBloc, RhapsodyState>(
          builder:(context,state){
            if(state is RhapsodyLoaded){
            return EventListDisplay(rhapsodyList: state.userRhapsodyModel);
            }
return EmptyRhapsodyList();
        }
        )
        , 
      ),
    );
  }
}

class EmptyRhapsodyList extends StatelessWidget {
  const EmptyRhapsodyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class EventListDisplay extends StatefulWidget {
  final List<UserRhapsodyModel> rhapsodyList;

  const EventListDisplay({Key key, this.rhapsodyList}) : super(key: key);
  
  @override
  EventListDisplayState createState() => EventListDisplayState();
}



class EventListDisplayState extends State<EventListDisplay> {
 
  bool deleted = false;
  UserRhapsodyModel deletingRhapsodyData;

  @override
  Widget build(BuildContext context) {
    //final filteredRhapsody = eventDisplay(selectedDate, rhapsodyList);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: widget.rhapsodyList.length,
          itemBuilder: (BuildContext eventContext, int index,) {
            return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            BlocProvider.of<RhapsodyBloc>(context).add(RhapsodyDeletedEvent(rhapsody:widget.rhapsodyList[index]));
                // Remove the item from the data source.
                setState(() {
                  deletingRhapsodyData = widget.rhapsodyList[index];
                  widget.rhapsodyList.removeAt(index);
                  deleted = !deleted;

                if(deleted)Flushbar(
      
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [BoxShadow(color: Colors.blue[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)],
      backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: true,
      duration: Duration(seconds: 3),
      icon: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "${deletingRhapsodyData.title} dismissed",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),
           
      ),
       messageText:Text(
        "Rhapsody Entry for ${deletingRhapsodyData.eventDate} deleted",
        style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
      ),
      
          )..show(context);

                

                // Then show a snackbar.
             
              });
              },

               background: Container(color: Colors.red),
                          child: Card(
                            

                elevation: 2.0,
                color: Color(0xFF8f94fb),
                child: GestureDetector(
                  onLongPress: (){
                   
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              EditRhapsodyRecord(widget.rhapsodyList[index])));
                   
                  },
                                  child: ExpansionTile(
                    children: 
                  [
                    Text(widget.rhapsodyList[index].note,
                    style:rorRecordTextStyle.copyWith(color:Colors.white),) ,
                  ],

                  backgroundColor: Colors.black,
                  leading: CircleAvatar(
  backgroundImage: AssetImage("assets/images/RhapsodyLogo.png"), // no matter how big it is, it won't overflow
),
                  
                  initiallyExpanded: false,
                  childrenPadding: EdgeInsets.symmetric(horizontal:10),
                    title: Text(
                      "ROR TOPIC: ${widget.rhapsodyList[index].title.toUpperCase()}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                       child: Text(
                         "Rhapsody Entry for ${dateFormat(widget.rhapsodyList[index].eventDate)}",
                         style: TextStyle(fontSize: 16),
                       ),
                    ),
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