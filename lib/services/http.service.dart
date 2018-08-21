import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/models/Places/place.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final _http = HttpClient();
  final Dio _dio;
  final Authorize _authorize = new Authorize();

  final String baseUrl;

  ApiClient(url)
      : baseUrl = url,
        _dio = new Dio(new Options(
          baseUrl: url,
          receiveTimeout: 3000,
        ));

  Future<dynamic> _getJson(Uri uri) async {
    print(uri.toString());
    Response response;
    response = await _dio.get(uri.toString());
    return response.data;
  }

  void init() {
    _dio.interceptor.response.onError = (DioError error) async {
      var token = await _authorize.getToken();
      var tokenHeader = 'Bearer $token';
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 403) {
        Options options = error.response.request;
        // If the token has been updated, repeat directly.
        if (tokenHeader != options.headers["Authorization"]) {
          options.headers["Authorization"] = tokenHeader;
          //repeat
          return _dio.request(options.path, options: options);
        }

        await _authorize.refreshToken();
        token = await _authorize.getToken();
        options.headers["Authorization"] = 'Bearer $token';
        return _dio.request(options.path, options: options);
      }
      return error;
    };

    _dio.interceptor.request.onSend = (Options o) async {
      var token = await _authorize.getToken();
      o.headers['Authorization'] = 'Bearer $token';
      if (o.method == "POST") {
        o.headers['content-length'] = utf8.encode(json.encode(o.data)).length;
      }
      return o;
    };
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

  Future changeColor(String deviceId, HSVColor color) async {
    var uri = Uri.https(baseUrl, 'api/Device/${deviceId}/ChangeColor');

    var data = {'Color': ColorDto(color), 'Type': 1};

    var response = await _dio.post(uri.toString(),
        data: data,
        options: Options(
          contentType: ContentType.JSON,
        ));
    debugPrint(response.data.toString());
  }

  Future<List<StandAnimation>> getAnimations(String code) {
    var url = Uri.https(baseUrl, 'api/Animations/GetAnimations', {"id": code});

    return _getJson(url).then((json) => json['Animations']).then((data) => data
        .map<StandAnimation>((anim) => StandAnimation.fromJson(anim))
        .toList());
  }

  Future<List<PipeAccesorySimple>> searchGear(
      String search, String type, int page, int pageSize) {
    var url = Uri.https(baseUrl, 'api//Gear/${type}/Search/${search}',
        {"page": page.toString(), "pageSize": pageSize.toString()});

    return _getJson(url).then((json) {
      return json
          .map<PipeAccesorySimple>((data) => PipeAccesorySimple.fromJson(data))
          .toList();
    });
  }

  Future<String> getSessionId(String id) async {
    var url = Uri.https(baseUrl, 'api/SmokeSession/GetSessionCode', {"id": id});
    var result =  await _dio.get(url.toString());
    return result.data;
  }

  Future<List<PipeAccesory>> getMyGear() async {
    var url = Uri.https(baseUrl, 'api/Person/MyGear');
    return _getJson(url).then((data) =>
        data.map<PipeAccesory>((p) => PipeAccesory.fromJson(p)).toList());
  }
}

class ColorDto {
  final HSVColor color;

  ColorDto(this.color);

  Map<String, dynamic> toJson() => {
        'Hue': color.hue.clamp(0, 360) * 360 ~/ 255,
        'Saturation': (color.saturation.clamp(0, 1) * 255).toInt(),
        'Value': 255
      };
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
