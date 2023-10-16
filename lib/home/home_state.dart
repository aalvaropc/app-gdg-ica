import 'package:equatable/equatable.dart';
import 'package:gdgica/home/session.dart';
import 'package:gdgica/home/speaker.dart';
import 'package:gdgica/home/team.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  /// Copy object for use in action
  HomeState getStateCopy();

  @override
  List<Object?> get props => [];
}

/// UnInitialized
class UnHomeState extends HomeState {
  @override
  String toString() => 'UnHomeState';

  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }
}

/// Initialized
class InHomeState extends HomeState {
  final SpeakersData? speakersData;
  final SessionsData? sessionsData;
  final TeamsData? teamsData;

  const InHomeState({
    @required this.speakersData,
    @required this.sessionsData,
    @required this.teamsData,
  });

  @override
  String toString() => 'InHomeState';

  //removing this
  @override
  HomeState getStateCopy() {
    return InHomeState(
      speakersData: speakersData,
      sessionsData: sessionsData,
      teamsData: teamsData,
    );
  }

  @override
  List<Object?> get props => [speakersData, sessionsData, teamsData];
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  const ErrorHomeState(this.errorMessage);

  @override
  String toString() => 'ErrorHomeState';

  //removing this
  @override
  HomeState getStateCopy() {
    return ErrorHomeState(errorMessage);
  }
}
