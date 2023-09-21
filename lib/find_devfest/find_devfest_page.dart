import 'package:flutter/material.dart';
import 'package:gdgica/universal/dev_scaffold.dart';
class FindDevFestPage extends StatelessWidget {
  static const String routeName = "/find";
  const FindDevFestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const DevScaffold(
      body: Center(
        child: Text("Coming Soon"),
      ),
      title: "Find A DevFest",
    );
  }
}