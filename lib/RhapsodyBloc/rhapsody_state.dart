part of 'rhapsody_bloc.dart';

abstract class RhapsodyState extends Equatable {
  const RhapsodyState();

  List<Object> get props => [];
}

class RhapsodyInitial extends RhapsodyState {}

class RhapsodyLoading extends RhapsodyState {}

class RhapsodyLoaded extends RhapsodyState {
  final List<UserRhapsodyModel> userRhapsodyModel;
  final Map<DateTime, List<dynamic>> markedDateMap;

  RhapsodyLoaded({this.userRhapsodyModel, this.markedDateMap});

  @override
  List<Object> get props => [
        userRhapsodyModel,
        markedDateMap,
      ];
}

class RhapsodyLoadFailed extends RhapsodyState {}

class RhapsodySaveFailed extends RhapsodyState {
  final String errorMessage;

  RhapsodySaveFailed(this.errorMessage);
  @override
  List<Object> get props => [
        errorMessage,
      ];
}
