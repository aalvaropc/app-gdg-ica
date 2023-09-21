// import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdgica/home/session.dart';
import 'package:gdgica/home/speaker.dart';
import 'package:gdgica/universal/dev_scaffold.dart';
// import 'package:gdgica/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetail extends StatelessWidget {
  static const String routeName = "/session_detail";
  final Session? session;

  const SessionDetail({Key? key, @required this.session}) : super(key: key);

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(
              FontAwesomeIcons.facebookF,
                size: 15,
              ),
              onPressed: () {
                  launchUrl(Uri.parse(speakers[0].fbUrl!));
              },
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.twitter,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse(speakers[0].twitterUrl!));
              },
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.linkedinIn,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse(speakers[0].linkedinUrl!));
              },
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.github,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse(speakers[0].githubUrl!));
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: session!.speakerImage ?? "",
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: CachedNetworkImageProvider(
                      session!.speakerImage ?? "",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${session?.speakerDesc}",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              // Text(
              //   "${session.sessionTitle}",
              //   textAlign: TextAlign.center,
              //   // style: Theme.of(context).textTheme.title.copyWith(
              //   //       fontSize: 20,
              //   //       fontWeight: FontWeight.bold,
              //   //     ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Text(
                session!.sessionDesc ?? "",
                textAlign: TextAlign.center,
                // style:
                    // Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 20,
              ),
              socialActions(context),
            ],
          ),
        ),
      ),
      title: session!.speakerName,
    );
  }
}
