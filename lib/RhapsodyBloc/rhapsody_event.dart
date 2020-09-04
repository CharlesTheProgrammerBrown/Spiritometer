part of 'rhapsody_bloc.dart';

abstract class RhapsodyEvent extends Equatable {
  const RhapsodyEvent();
  @override
  List<Object> get props => [];
}

class RhapsodyEntryLoadEvent extends RhapsodyEvent {}

class RhapsodyEntryUpdated extends RhapsodyEvent {
  final List<UserRhapsodyModel> rhapsodies;

  @override
  String toString() {
    return 'RhapsodyEntryUpdated{rhapsodies: $rhapsodies}';
  }

  RhapsodyEntryUpdated(this.rhapsodies);

  @override
  List<Object> get props => [rhapsodies];
}

class RhapsodyDeletedEvent extends RhapsodyEvent{
  final UserRhapsodyModel rhapsody;

  RhapsodyDeletedEvent({this.rhapsody});

  @override
  List<Object> get props => [rhapsody];

  @override
  String toString() => 'RhapsodyDeletedEvent { rhapsody: $rhapsody }';
}


class RhapsodySavedEvent extends RhapsodyEvent {
  final String title;
  final String note;
  final DateTime eventDate;

  @override
  String toString() {
    return 'RhapsodySavedEvent{title: $title, note: $note, eventDate: $eventDate}';
  }

  RhapsodySavedEvent({this.title, this.note, this.eventDate});

  @override
  List<Object> get props => [
        title,
        note,
        eventDate,
      ];
}
