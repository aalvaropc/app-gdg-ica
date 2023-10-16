import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdgica/agenda/session_detail.dart';
import 'package:gdgica/home/session.dart';
import 'package:gdgica/utils/tools.dart';


class SessionList extends StatelessWidget {
  final List<Session>? allSessions;
  const SessionList({Key? key, this.allSessions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: allSessions!.length,
      itemBuilder: (c, i) {
        return Card(
          elevation: 0.0,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SessionDetail(
                    session: allSessions![i],
                  ),
                ),
              );
            },
                    // .title
            dense: true,
            isThreeLine: true,
            trailing: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "${allSessions![i].sessionTotalTime}\n",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: allSessions![i].sessionStartTime,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
            leading: Hero(
              tag: allSessions![i].speakerImage!,
              child: CircleAvatar(
                radius: 30,
                backgroundImage:
                    CachedNetworkImageProvider(allSessions![i].speakerImage!),
              ),
            ),
            title: Text.rich(
              TextSpan(
                text: "${allSessions![i].sessionTitle}\n",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 16),
                children: [
                  TextSpan(
                      text: allSessions![i].speakerName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            color: Tools.multiColors[Random().nextInt(4)],
                          ),
                      children: const []),
                ],
              ),
            ),
            subtitle: Text(
              allSessions![i].speakerDesc!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 10.0,
                  ),
            ),
          ),
        );
      },
    );
  }
}
