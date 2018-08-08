import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/models/Places/place.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/cupertino.dart';

class ApiClient {
  static final _client = ApiClient._internal();
  final _http = HttpClient();
  final Authorize _authorize = new Authorize();
  ApiClient._internal();

  final String baseUrl;

  ApiClient(url) : baseUrl = url;

  Future<dynamic> _getJson(Uri uri) async {
    print(uri.toString());
    var response =
        (await _http.getUrl(uri).then((HttpClientRequest request) async {
      var token = await _authorize.getToken();
      request.headers.add('Authorization', 'Bearer $token');
      return request.close();
    }));

    if (response.statusCode == 403) {
      if (await _authorize.refreshToken()) {
        return _getJson(uri);
      }
    }

    if (response.statusCode != 200) {
      print(response);
    }

    var transformedResponse = await response.transform(utf8.decoder).join();
    return json.decode(transformedResponse);
  }

  Future<dynamic> _(Uri uri) async {
    var response = await (await _http.getUrl(uri)).close();
    var transformedResponse = await response.transform(utf8.decoder).join();
    return json.decode(transformedResponse);
  }

  Future<List<TobaccoMix>> fetchtobacoMix(
      {int page: 0, String category: "popular", int pageSize: 10}) async {
    var url = Uri.https(baseUrl, '/api/Mixology/GetMixes',
        {"page": page.toString(), 'pageSize': pageSize.toString()});

    return _getJson(url).then((json) => json['Mixes']).then((data) =>
        data.map<TobaccoMix>((mix) => TobaccoMix.fromJson(mix)).toList());
  }

  Future<SessionIdValidation> validateSessionId(String sessionId) {
    var url =
        Uri.https(baseUrl, 'api/SmokeSession/Validate', {"id": sessionId});

    return _getJson(url).then((json) => SessionIdValidation.fromJson(json));
  }

  Future<SmokeSession> getInitData(String sessionId) {
    var url =
        Uri.https(baseUrl, 'api/SmokeSession/InitData', {"id": sessionId});
    return _getJson(url).then((json) =>
        SmokeSession.fromJson(json['SmokeSession'] as Map<String, dynamic>));
  }

  Future<List<Place>> getNearbyPlaces() {
    var uri = Uri.https(baseUrl, 'api/Places/SearchNearby');

    return _getJson(uri).then((json) {
      var list = json['NearbyPlaces'] as List;

      return list.map((f) {
        return Place.fromJson(f);
      }).toList();
    });
  }

Future<List<StandAnimation>> getAnimations(String code) {
var url = Uri.https(baseUrl, 'api/Animations/GetAnimations',{"id":code});

 return _getJson(url).then((json) => json['Animations']).then((data) =>
        data.map<StandAnimation>((anim) => StandAnimation.fromJson(anim)).toList());
}

}

class SessionIdValidation extends Dto {
  final String id;
  final SessionState state;
  SessionIdValidation({this.id, this.state}) : super();

  SessionIdValidation.fromJson(Map<String, dynamic> map)
      : id = map["Id"],
        state = SessionState.values[map["Flag"]];
}

class Dto {
  final bool success;
  final String message;
  final int httpResponseCode;

  Dto({this.success, this.message, this.httpResponseCode});

  Dto.fromJson(Map<String, dynamic> map)
      : success = map["Success"],
        message = map["Message"],
        httpResponseCode = map["HttpResponseCode"];
}

enum SessionState { live, completed }
