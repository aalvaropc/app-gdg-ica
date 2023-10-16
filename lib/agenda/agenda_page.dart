import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gdgica/agenda/cloud_screen.dart';
import 'package:gdgica/agenda/mobile_screen.dart';
import 'package:gdgica/agenda/web_screen.dart';
import 'package:gdgica/home/index.dart';
import 'package:gdgica/universal/dev_scaffold.dart';
import 'package:gdgica/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendaPage extends StatelessWidget {
  static const String routeName = "/agenda";
  const AgendaPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homeBloc = HomeBloc();
    return DefaultTabController(
      length: 3,
      child: DevScaffold(
        title: "Agenda",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: const <Widget>[
            Tab(
              icon: Icon(
                FontAwesomeIcons.cloud,
                size: 12,
              ),
              child: Text("Cloud"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.mobile,
                size: 12,
              ),
              child: Text("Mobile"),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.chrome,
                size: 12,
              ),
              child: Text("Web & More"),
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CloudScreen(
              key: const Key('cloud_screen'),
              homeBloc: homeBloc,
            ),
            MobileScreen(
              key: const Key('mobile_screen'),
              homeBloc: homeBloc,
            ),
            WebScreen(
              key: const Key('web_screen'),
              homeBloc: homeBloc,
            ),
          ],
        ),
      ),
    );
  }
}
