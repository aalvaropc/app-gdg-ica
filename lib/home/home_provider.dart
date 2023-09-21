import 'package:gdgica/home/session.dart';
import 'package:gdgica/home/speaker.dart';
import 'package:gdgica/home/team.dart';
import 'package:gdgica/network/i_client.dart';
import 'package:gdgica/utils/dependency_injection.dart';
import 'package:gdgica/utils/devfest.dart';

abstract class IHomeProvider {
  Future<SpeakersData> getSpeakers();
  Future<SessionsData> getSessions();
  Future<TeamsData> getTeams();
}

class HomeProvider implements IHomeProvider {
  IClient? _client;

  static final String kConstGetSpeakersUrl =
      "${Devfest.baseUrl}/speaker-kol.json";

  static final String kConstGetSessionsUrl =
      "${Devfest.baseUrl}/session-kol.json";

  static final String kConstGetTeamsUrl = "${Devfest.baseUrl}/team-kol.json";

  HomeProvider() {
    _client = Injector().currentClient;
  }

  @override
  Future<SpeakersData> getSpeakers() async {
    var result = await _client!.getAsync(kConstGetSpeakersUrl);
    if (result.networkServiceResponse?.success == true) {
      SpeakersData res = SpeakersData.fromJson(result.mappedResult);
      return res;
    }

    throw Exception(result.networkServiceResponse!.message);
  }

  @override
  Future<SessionsData> getSessions() async {
    var result = await _client!.getAsync(kConstGetSessionsUrl);
    if (result.networkServiceResponse?.success == true) {
      SessionsData res = SessionsData.fromJson(result.mappedResult);
      return res;
    }

    throw Exception(result.networkServiceResponse!.message);
  }

  @override
  Future<TeamsData> getTeams() async {
    var result = await _client!.getAsync(kConstGetTeamsUrl);
    if (result.networkServiceResponse?.success == true) {
      TeamsData res = TeamsData.fromJson(result.mappedResult);
      return res;
    }

    throw Exception(result.networkServiceResponse!.message);
  }
}
