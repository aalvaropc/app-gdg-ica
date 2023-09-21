import 'package:flutter/material.dart';
import 'package:gdgica/universal/dev_scaffold.dart';

class FaqPage extends StatelessWidget {
  static const String routeName = "/faq";
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DevScaffold(
      body: Center(
        child: Text("Coming Soon"),
      ),
      title: "FAQ",
    );
 }
}