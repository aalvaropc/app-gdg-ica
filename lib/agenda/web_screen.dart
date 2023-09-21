import 'package:flutter/material.dart';
import 'package:gdgica/agenda/session_list.dart';
import 'package:gdgica/home/index.dart';

class WebScreen extends StatelessWidget {
  final HomeBloc? homeBloc;

  const WebScreen({Key? key, this.homeBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var state = homeBloc!.state as InHomeState;
    var sessions = state.sessionsData!.sessions;
    var webSessions = sessions!.where((s) => s.track == "web").toList();
    return SessionList(
      allSessions: webSessions,
    );
  }
}

