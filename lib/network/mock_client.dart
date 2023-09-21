// *  Not needed as of now
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:gdgica/home/home_provider.dart';
import 'package:gdgica/home/session.dart';
import 'package:gdgica/home/speaker.dart';
import 'package:gdgica/home/team.dart';
import 'package:gdgica/utils/dependency_injection.dart';
import 'package:gdgica/utils/devfest.dart';

import 'index.dart';

class MockClient implements IClient {
  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
    {bool? customHeaders}) async {
    // var  resultClass;
    dynamic resultClass;
    String rawString;

    //? For Speakers Hardcoded Data
    if (resourcePath == HomeProvider.kConstGetSpeakersUrl) {
      if (Injector().currentDataMode == DataMode.dart) {
        rawString = jsonEncode(SpeakersData(speakers: speakers));
      } else {
        rawString = await rootBundle.loadString(Devfest.speakersAssetJson);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    //? For Sessions Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetSessionsUrl) {
      if (Injector().currentDataMode == DataMode.dart) {
        rawString = jsonEncode(SessionsData(sessions: sessions));
      } else {
        rawString = await rootBundle.loadString(Devfest.sessionsAssetJson);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    //? For Teams Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetTeamsUrl) {
      if (Injector().currentDataMode == DataMode.dart) {
        rawString = jsonEncode(TeamsData(teams: teams));
      } else {
        rawString = await rootBundle.loadString(Devfest.teamsAssetJson);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    return MappedNetworkServiceResponse<T>(
        mappedResult: resultClass,
        networkServiceResponse: NetworkServiceResponse<T>(success: true));
  }

  @override
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String? resourcePath, data,
      {bool customHeaders = false}) {

    // return null;
    return Future.value(MappedNetworkServiceResponse<T>());
  }

  // * JSON Decoding using Isolates
  static Map<String, dynamic> jsonParserIsolate(String res) {
    return jsonDecode(res);
  }
  
}
