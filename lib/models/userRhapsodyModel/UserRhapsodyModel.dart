import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyEntity.dart';

@immutable
class UserRhapsodyModel extends Equatable {
  final String title;
  final String note;
  final DateTime eventDate;

  UserRhapsodyModel({this.title, this.note, this.eventDate});

  UserRhapsodyModel copyWith({
    String title,
    String note,
    DateTime eventDate,
  }) {
    return UserRhapsodyModel(
      title: title ?? this.title,
      note: note ?? this.note,
      eventDate: eventDate?? this.eventDate,
    );
  }

  UserRhapsodyEntity rhapsodyModelToEntity() {
    return UserRhapsodyEntity(
      title: title,
      note: note,
      eventDate: eventDate,
    );
  }

//convert entity objects into Rhapsody Model
//contents of entity from Firebase
static UserRhapsodyModel rhapsodyModelFromEntity(UserRhapsodyEntity entity){
  return UserRhapsodyModel(
    title: entity.title,
    note: entity.note,
    eventDate: entity.eventDate,
  );
}
  @override
  List<Object> get props => [
        title,
        note,
        eventDate,
      ];

  @override
  String toString() {
    return 'RhapsodyModel($title,$note, $eventDate)';
  }
}
