import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdgica/home/index.dart';
import 'package:gdgica/universal/dev_scaffold.dart';
import 'package:gdgica/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatelessWidget {
  static const String routeName = "/team";
  const TeamPage({Key? key}) : super(key: key);

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.facebookF,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse("speakers[0].fbUrl"));
                // launch(speakers[0].fbUrl);
              },
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.twitter,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse("speakers[0].twitterUrl"));
                // launch(speakers[0].twitterUrl);
              },
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.linkedinIn,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse("speakers[0].linkedinUrl"));
                // launch(speakers[0].linkedinUrl);
              },
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.github,
                size: 15,
              ),
              onPressed: () {
                launchUrl(Uri.parse("speakers[0].githubUrl"));
                // launch(speakers[0].githubUrl);
              },
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    var homeBloc = HomeBloc();
    // var state = _homeBloc.currentState as InHomeState;
    var state = homeBloc.state as InHomeState;
    var teams = state.teamsData!.teams;
    return DevScaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (c, i) {
          return Card(
            elevation: 0.0,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: teams[i].image ?? '',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                teams[i].name ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: 5,
                                color: Tools.multiColors[Random().nextInt(4)],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            teams[i].desc ?? "",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            teams[i].contribution?? "",
                            // style: Theme.of(context).textTheme.caption,
                          ),
                          socialActions(context),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
        itemCount: teams!.length,
      ),
      title: "Equipo",
    );
  }
}
