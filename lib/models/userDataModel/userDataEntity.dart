//converts data from firebase for userdata model format

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserDataEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String photoUrl;

  UserDataEntity({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.photoUrl,
  });


  static UserDataEntity fromSnapshot(DocumentSnapshot snap) {
    return UserDataEntity(
      //reads snapshot
      id: snap.documentID,
      email: snap.data['email'],
      name: snap.data['name'],
      photoUrl: snap.data['photoUrl'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      //firebase collection field format where to save
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        photoUrl,
      ];

  @override
  String toString() {
    return 'UserDataEntity($id,$email,$name,$photoUrl)';
  }
}
