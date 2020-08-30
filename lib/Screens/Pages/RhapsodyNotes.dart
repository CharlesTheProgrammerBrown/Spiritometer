import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spiritometer/RhapsodyBloc/rhapsody_bloc.dart';
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

class EventListDisplay extends StatelessWidget {
  const EventListDisplay({
    Key key,
    
    this.rhapsodyList,
  }) : super(key: key);

 
  final List<UserRhapsodyModel> rhapsodyList;

  @override
  Widget build(BuildContext context) {
    //final filteredRhapsody = eventDisplay(selectedDate, rhapsodyList);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: rhapsodyList.length,
          itemBuilder: (BuildContext eventContext, int index) {
            return Card(
              elevation: 2.0,
              color: Color(0xFF8f94fb),
              child: ExpansionTile(children: [
                Text(rhapsodyList[index].note,
                style:rorRecordTextStyle.copyWith(color:Colors.white),) ,
              ],

              backgroundColor: Colors.black,
              leading: CircleAvatar(
  backgroundImage: AssetImage("assets/images/RhapsodyLogo.png"), // no matter how big it is, it won't overflow
),
              initiallyExpanded: false,
              childrenPadding: EdgeInsets.symmetric(horizontal:10),
                title: Text(
                  "ROR TOPIC: ${rhapsodyList[index].title.toUpperCase()}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                   child: Text(
                     "Rhapsody Entry for ${dateFormat(rhapsodyList[index].eventDate)}",
                     style: TextStyle(fontSize: 16),
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