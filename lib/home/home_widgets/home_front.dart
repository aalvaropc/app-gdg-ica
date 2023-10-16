import 'package:flutter/material.dart';
import 'package:gdgica/agenda/agenda_page.dart';
import 'package:gdgica/config/index.dart';
import 'package:gdgica/faq/faq_page.dart';
import 'package:gdgica/map/map_page.dart';
import 'package:gdgica/speakers/speaker_page.dart';
import 'package:gdgica/sponsors/sponsor_page.dart';
import 'package:gdgica/team/team_page.dart';
import 'package:gdgica/universal/image_card.dart';
import 'package:gdgica/utils/devfest.dart';
import 'package:gdgica/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  const HomeFront({Key? key}) : super(key: key);
  List<Widget> devFestTexts(context) => [
        Text(
          Devfest.welcomeText,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          Devfest.descText,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ];

  // _launchURL(String url) async {
  //   Uri urlparse = Uri.parse(url);
  //   if (await canLaunchUrl(urlparse)) {
  //     await launchUrl(urlparse);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Widget actions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.0,
        children: <Widget>[
          ElevatedButton(
            child: const Text("Agenda"),
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          ElevatedButton(
            child: const Text("Ponentes"),
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          ElevatedButton(
            child: const Text("Sponsors"),
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          ElevatedButton(
            child: const Text("Equipo"),
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ElevatedButton(
            child: const Text("FAQ"),
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          ElevatedButton(
            child: const Text("Ubícanos"),
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          ),
        ],
      );

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ActionCard(
            icon: Icons.schedule,
            color: Colors.red,
            title: Devfest.agendaText,
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          ActionCard(
            icon: Icons.person,
            color: Colors.green,
            title: Devfest.speakersText,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          ActionCard(
            icon: Icons.people,
            color: Colors.amber,
            title: Devfest.teamText,
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: Colors.purple,
            title: Devfest.sponsorText,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          ActionCard(
            icon: Icons.question_answer,
            color: Colors.brown,
            title: Devfest.faqText,
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          ActionCard(
            icon: Icons.map,
            color: Colors.blue,
            title: Devfest.mapText,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          )
        ],
      );

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.twitter),
              onPressed: () {
                Uri twitterUrl = Uri.parse('https://twitter.com/GDGICA');
                _launch(
                    twitterUrl);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () {
                Uri linkedinUrl = Uri.parse('https://www.linkedin.com/company/gdg-ica/');
                _launch(
                    linkedinUrl);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.youtube),
              onPressed: () {
                Uri youtubeUrl = Uri.parse('https://www.youtube.com/@GDGICA');
                _launch(
                    youtubeUrl);
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.facebook),
              onPressed: () {
                Uri facebookUrl = Uri.parse(
                    'https://www.facebook.com/gdgica');
                _launch(
                    facebookUrl);
              },
            ),
          ],
        ),
      );

  Future<void> _launch(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    ElevatedButton roundedButton = ElevatedButton(
      onPressed: () {
        Uri googleUrl = Uri.parse(
            'https://www.eventbrite.com/e/entradas-devfest-ica-718100236137');
        _launch(
            googleUrl);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10.0),
        ),
      ),
      child: const Text('Regístrate'),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeOn
                  ? Devfest.bannerDark
                  : Devfest.bannerLight,
            ),
            const SizedBox(
              height: 30,
            ),
            roundedButton,
            const SizedBox(
              height: 30,
            ),
            newActions(context),
            const SizedBox(
              height: 20,
            ),
            socialActions(context),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Devfest.appVersion,
              // style: Theme.of(context).textTheme.bodySmall.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? title;
  final Color? color;

  const ActionCard(
      {Key? key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    // color: Colors.grey[200],
                    color: (Colors.grey[200])!,
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title!,
              // style: Theme.of(context).textTheme.title.copyWith(
              //       fontSize: 12,
              //     ),
            ),
          ],
        ),
      ),
    );
  }
}
