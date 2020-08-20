import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rhapsody_event.dart';
part 'rhapsody_state.dart';

class RhapsodyBloc extends Bloc<RhapsodyEvent, RhapsodyState> {
  RhapsodyBloc() : super(RhapsodyInitial());

  @override
  Stream<RhapsodyState> mapEventToState(
    RhapsodyEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
