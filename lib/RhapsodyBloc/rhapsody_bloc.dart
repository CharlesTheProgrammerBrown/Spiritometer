import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyModel.dart';
import 'package:spiritometer/models/userRhapsodyModel/UserRhapsodyRepository.dart';

part 'rhapsody_event.dart';

part 'rhapsody_state.dart';

class RhapsodyBloc extends Bloc<RhapsodyEvent, RhapsodyState> {
  //data fetch from repo
  final UserRhapsodyRepository userRhapsodyRepository;
  StreamSubscription _rhapsodySubscription;

  RhapsodyBloc(this.userRhapsodyRepository) : super(RhapsodyInitial());

  @override
  Stream<RhapsodyState> mapEventToState(
    RhapsodyEvent event,
  ) async* {
    if (event is RhapsodyEntryLoadEvent) {
      yield* _mapRhapsodyEntryLoadToState();
    } else if (event is RhapsodyEntryUpdated) {
      yield* _mapUpdateRhapsodyEntryToState(event);
    }
  }

  Stream<RhapsodyState> _mapRhapsodyEntryLoadToState() async* {
    yield RhapsodyLoading();
    _rhapsodySubscription?.cancel();
    _rhapsodySubscription =
        userRhapsodyRepository.getListOfUserRhapsodyData().listen((rhapsodies) {
      add(
        RhapsodyEntryUpdated(rhapsodies),
      );
    });
  }

  Stream<RhapsodyState> _mapUpdateRhapsodyEntryToState(
      RhapsodyEntryUpdated event) async* {
    await Future.delayed(Duration(milliseconds: 500));
    final EventList<Event> _markedDateMap = new EventList<Event>(
      events: {
        DateTime(2020, 8, 18): [
          Event(
            date: DateTime.now(),
            title: 'Event 1',
            icon: Icon(Icons.person),
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: Colors.red,
              height: 8.0,
              width: 8.0,
            ),
          ),
        ],
        DateTime(2020, 8, 22): [
          Event(
            date: DateTime(2020, 8, 17),
            title: 'Event 2',
            icon: Icon(Icons.person),
            dot: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              color: Colors.red,
              height: 8.0,
              width: 8.0,
            ),
          ),
        ]
      },
    );

    yield RhapsodyLoaded(
        userRhapsodyModel: event.rhapsodies, markedDateMap: _markedDateMap);
  }
}
