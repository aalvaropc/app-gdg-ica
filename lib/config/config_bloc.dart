import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gdgica/config/index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();
  factory ConfigBloc() {
    return _configBlocSingleton;
  }
  ConfigBloc._internal() : super(UnConfigState());

  bool darkModeOn = false;

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    try {
      yield UnConfigState();
      yield await event.applyAsync(currentState: state, bloc: this);
      } catch (_) {
      yield state;
    }
  }
}
