import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spiritometer/models/userDataModel/userDataEntity.dart';

@immutable
class UserDataModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String photoUrl;

  UserDataModel({
    this.id,
     this.email,
    this.name,
    this.photoUrl,
  });

  UserDataModel copyWith({
    String id,
    String email,
    String name,
    String photoUrl,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  UserDataEntity userDataEntity() {
    return UserDataEntity(
      id: id,
      email: email,
      name: name,
      photoUrl: photoUrl,
    );
  }

  static UserDataModel fromEntity(UserDataEntity entity) {
    return UserDataModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      photoUrl: entity.photoUrl,
    );
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
    return 'UserDataModel($id,$email,$name,$photoUrl)';
  }
}
