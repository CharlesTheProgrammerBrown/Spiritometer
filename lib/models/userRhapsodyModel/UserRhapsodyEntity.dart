import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//converts data from RhapsodyModel to entity class for firebase(json)
//and vice-versa

class UserRhapsodyEntity extends Equatable {
  final String id;
  final String title;
  final String note;
  final DateTime eventDate;

  UserRhapsodyEntity({
    @required this.id,
    @required this.title,
    @required this.note,
    @required this.eventDate,
  });

//FROM Firebase document snapshot, place data into entity
//later to be converted to RhapsodyModel
  static UserRhapsodyEntity fromSnapshot(DocumentSnapshot snap) {
    return UserRhapsodyEntity(
      id: snap.documentID,
      title: snap.data['title'],
      note: snap.data['note'],
      eventDate: snap.data['eventDate'].toDate(),
    );
  }

//used by RhapsodyModel to take what's stored in entity and put in
//json like format for firebase documents

  Map<String, Object> toDocument() {
    return {
    'title': title, 
    'note': note, 
    'eventDate': eventDate,
    };
  }

  @override
  List<Object> get props => [
    id,
        title,
        note,
        eventDate,
      ];

      @override 
      String toString() {
        return 'UserRhapsodyEntity($id,$title,$note,$eventDate)';
      }

}
