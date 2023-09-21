import 'dart:async';
import 'package:gdgica/config/index.dart';
import 'package:gdgica/utils/devfest.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigEvent {
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;
  DarkModeEvent(this.darkOn);
  @override
  String toString() => 'DarkModeEvent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState? currentState, ConfigBloc? bloc}) async {
    try {
      bloc!.darkModeOn = darkOn;
      Devfest.prefs.setBool(Devfest.darkModePref, darkOn);
      return InConfigState();
    } catch (_, stackTrace) {
      return ErrorConfigState('');
    }
  }
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() => 'LoadConfigEvent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState? currentState, ConfigBloc? bloc}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState('');
    }
  }
}
