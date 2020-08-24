import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
     Map<DateTime, List<dynamic>> _markedDateMap =  {
  DateTime(2020, 8, 25): ['Rhapsody'],
  DateTime(2020, 8, 26): ['Success'],
  DateTime(2020, 8, 24): ['Valentine'],
  DateTime(2020, 8, 21): ['Easter'],
  DateTime(2020, 8, 22): ['Easter Monday'],

     };
  
  

    yield RhapsodyLoaded(
        userRhapsodyModel: event.rhapsodies, markedDateMap: _markedDateMap);
  }
}
