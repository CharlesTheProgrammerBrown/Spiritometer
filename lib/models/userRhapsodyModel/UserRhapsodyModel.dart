import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyEntity.dart';

@immutable
class UserRhapsodyModel extends Equatable {
  final String title;
  final String note;
  final Timestamp createdOn;

  UserRhapsodyModel({this.title, this.note, this.createdOn});

  UserRhapsodyModel copyWith({
    String title,
    String note,
  }) {
    return UserRhapsodyModel(
      title: title ?? this.title,
      note: note ?? this.note,
    );
  }

  UserRhapsodyEntity rhapsodyModelToEntity() {
    return UserRhapsodyEntity(
      title: title,
      note: note,
    );
  }

//convert entity objects into Rhapsody Model
//contents of entity from Firebase
static UserRhapsodyModel rhapsodyModelFromEntity(UserRhapsodyEntity entity){
  return UserRhapsodyModel(
    title: entity.title,
    note: entity.note,
    createdOn: entity.createdOn,
  );
}
  @override
  List<Object> get props => [
        title,
        note,
        createdOn,
      ];

  @override
  String toString() {
    return 'RhapsodyModel($title,$note, $createdOn)';
  }
}
