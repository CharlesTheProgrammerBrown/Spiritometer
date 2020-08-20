part of 'rhapsody_bloc.dart';

abstract class RhapsodyState extends Equatable {
  const RhapsodyState();
}

class RhapsodyInitial extends RhapsodyState {
  @override
  List<Object> get props => [];
}
