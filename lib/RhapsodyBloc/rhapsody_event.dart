part of 'rhapsody_bloc.dart';

abstract class RhapsodyEvent extends Equatable {
  const RhapsodyEvent();
  @override
  List<Object> get props => [];
}

class RhapsodyEntryLoadEvent extends RhapsodyEvent {}

class RhapsodyEntryUpdated extends RhapsodyEvent {
  final List<UserRhapsodyModel> rhapsodies;

  RhapsodyEntryUpdated(this.rhapsodies);

  @override
  List<Object> get props => [rhapsodies];
}

class RhapsodySavedEvent extends RhapsodyEvent {
  final String title;
  final String note;

  RhapsodySavedEvent({this.title, this.note});

  @override
  List<Object> get props => [
        title,
        note,
      ];
}
