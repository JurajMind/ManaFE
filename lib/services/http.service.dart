import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/models/PipeAccesory/pipe_accesory.dart';
import 'package:app/models/PipeAccesory/pipe_accesory_simple.dart';
import 'package:app/models/PipeAccesory/tobacco_mix.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/models/Stand/preset.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:tuple/tuple.dart';
import 'package:openapi/api.dart';

class ApiClient {
  final _http = HttpClient();
  final Dio _dio;
  final Authorize _authorize = new Authorize();

  final String baseUrl;

  ApiClient(url)
      : baseUrl = url,
        _dio = new Dio(new Options(
          baseUrl: url,
        ));

  Future<dynamic> _getJson(Uri uri) async {
    print(uri.toString());
    Response response;
    response = await _dio.get(uri.toString());
    return response.data;
  }

  Future<dynamic> _getJsonOld(Uri uri) async {
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

    var transformedResponse = await response.transform(utf8.decoder).join();
    return json.decode(transformedResponse);
  }

  Future<dynamic> _postJsonOld(Uri uri, dynamic data) async {
    var response =
        (await _http.postUrl(uri).then((HttpClientRequest request) async {
      var token = await _authorize.getToken();
      request.headers.add('Authorization', 'Bearer $token');
      request.headers
          .add('content-length', utf8.encode(json.encode(data)).length);
      List<int> bodyBytes = utf8.encode(data);
      request.add(bodyBytes);
      return request.close();
    }));

    if (response.statusCode == 403) {
      if (await _authorize.refreshToken()) {
        return _getJson(uri);
      }
    }

    var transformedResponse = await response.transform(utf8.decoder).join();
    return json.decode(transformedResponse);
  }

  void init() {
    _dio.interceptor.response.onError = (DioError error) async {
      if (error.response?.statusCode == 401 ||
          error.response?.statusCode == 403) {
        var token = await _authorize.getToken();
        var tokenHeader = 'Bearer $token';
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
      } else {
        print(error.message);
        print(error.response);
      }
      return error;
    };

    _dio.interceptor.request.onSend = (Options o) async {
      var token = await _authorize.getToken();
      o.headers['Authorization'] = 'Bearer $token';
      o.headers["Accept"] = "application/json";
      o.headers['content-type'] = 'application/json';
      print(o.data);
      if (o.method == "POST" && o.data != null) {
        if (Platform.isIOS) {
        } else {
          // o.headers['content-length'] = utf8.encode(json.encode(o.data)).length;
        }
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

    return _getJsonOld(url).then((json) => SessionIdValidation.fromJson(json));
  }

  Future<Tuple2<SmokeSession, StandSettings>> getInitData(String sessionId) {
    var url =
        Uri.https(baseUrl, 'api/SmokeSession/InitData', {"id": sessionId});
    return _getJson(url).then((json) {
      return new Tuple2(
          SmokeSession.fromJson(json['SmokeSession'] as Map<String, dynamic>),
          StandSettings.fromJson(
              json['DeviceSettings'] as Map<String, dynamic>));
    });
  }

  Future<List<PlaceSimpleDto>> getNearbyPlaces({double lat, double lng}) {
    Map<String, String> queryParameters = new Map<String, String>();
    if (lat != null && lng != null) {
      queryParameters['lat'] = '0'; // lat.toString();
      queryParameters['lng'] = '0'; //lng.toString();
    }
    var uri = Uri.https(baseUrl, 'api/Places/SearchNearby', queryParameters);

    return _getJson(uri).then((json) {
      var list = json['NearbyPlaces'] as List;

      return list.map((f) {
        return PlaceSimpleDto.fromJson(f);
      }).toList();
    });
  }

  Future changeColor(String deviceId, HSVColor color) async {
    var uri = Uri.https(baseUrl, 'api/Device/${deviceId}/ChangeColor');

    var data = {'Color': ColorDto(color), 'Type': 1};
    print('color ${ColorDto(color).toJson()}');
    var response = await _dio.post(uri.toString(),
        data: data,
        options: Options(
          contentType: ContentType.JSON,
        ));
    debugPrint(response.data.toString());
  }

  Future<bool> changeAnimation(
      int animationId, SmokeState type, String deviceId) async {
    print('ChangeAnimation{$animationId} ${type}');
    var uri = Uri.https(baseUrl, 'api/Device/${deviceId}/ChangeAnimation');
    var data = {
      'AnimationId': animationId,
      'Type': SmokeState.values.indexOf(type)
    };
    var response = await _dio.post(uri.toString(),
        data: data,
        options: Options(
          contentType: ContentType.JSON,
        ));
    debugPrint(response.data.toString());
    return true;
  }

  Future<bool> changeSpeed(int speed, SmokeState type, String deviceId) async {
    debugPrint('Change speed {$speed} ${type}');
    var uri = Uri.https(baseUrl, 'api/Device/${deviceId}/ChangeSpeed');
    var data = {
      'Speed': speed.toString(),
      'Type': SmokeState.values.indexOf(type)
    };
    var response = await _dio.post(uri.toString(),
        data: data,
        options: Options(
          contentType: ContentType.JSON,
        ));
    debugPrint(response.data.toString());
    return true;
  }

  Future<bool> changeBrightness(
      int brightness, SmokeState type, String deviceId) async {
    debugPrint('Change brghtness {$brightness} ${type}');
    var uri = Uri.https(baseUrl, 'api/Device/${deviceId}/ChangeBrightness');
    var data = {
      'Brightness': brightness.toString(),
      'Type': SmokeState.values.indexOf(type)
    };
    var response = await _dio.post(uri.toString(),
        data: data,
        options: Options(
          contentType: ContentType.JSON,
        ));
    debugPrint(response.data.toString());
    return true;
  }

  Future<List<StandAnimation>> getAnimations(String code) {
    var url = Uri.https(baseUrl, 'api/Animations/GetAnimations', {"id": code});

    return _getJson(url).then((json) => json['Animations']).then((data) => data
        .map<StandAnimation>((anim) => StandAnimation.fromJson(anim))
        .toList());
  }

  Future<List<PipeAccesorySimpleDto>> searchGear(
      String search, String type, int page, int pageSize) {
    var url = Uri.https(baseUrl, 'api/Gear/$type/Search/$search',
        {"page": page.toString(), "pageSize": pageSize.toString()});

    return _getJson(url).then((json) {
      return json
          .map<PipeAccesorySimpleDto>((data) => PipeAccesorySimpleDto.fromJson(data))
          .toList();
    });
  }

  Future<String> getSessionId(String id) async {
    var url = Uri.https(baseUrl, 'api/SmokeSession/GetSessionCode', {"id": id});
    var result = await _dio.get(url.toString());
    return result.data;
  }

  Future<List<PipeAccesorySimpleDto>> getMyGear() async {
    var url = Uri.https(baseUrl, 'api/Person/MyGear');
    return _getJson(url)
        .then((data) => PipeAccesorySimpleDto.listFromJson(data));
  }

  Future<PersonActiveDataDto> getPersonInitData() async {
    var url = Uri.https(baseUrl, 'api/Person/InitData');
    return _getJson(url).then((data) => PersonActiveDataDto.fromJson(data));
  }

  Future<SmokeSessionMetaData> postMetadata(
      String sessionCode, SmokeSessionMetaDataSelection value) async {
    var url =
        Uri.https(baseUrl, 'api/SmokeSession/${sessionCode}/SaveMetaData');
    var data = {
      'Id': value.id,
      'BowlId': value.bowl != null ? value.bowl.id : null,
      'PipeId': value.pipe != null ? value.pipe.id : null,
      'CoalId': value.coal != null ? value.coal.id : null,
      'HeatManagementId':
          value.heatManager != null ? value.heatManager.id : null,
    };

    var response = await _dio.post(url.toString(),
        data: data,
        options: Options(
          contentType: ContentType.JSON,
        ));
    debugPrint(response.data.toString());
    return SmokeSessionMetaData.fromJson(response.data);
  }

  Future<List<DevicePreset>> getDevicePresets() async {
    var url = Uri.https(baseUrl, 'api/Device/Preset/GetUserPresets');
    return _getJson(url).then((data) =>
        data.map<DevicePreset>((p) => DevicePreset.fromJson(p)).toList());
  }

  Future<bool> setDevicePreset(String sessionId, int presetId) async {
    print('Set preset on session {$sessionId}:${presetId.toString()}');
    var url = Uri.https(
        baseUrl, '/api/Device/Preset/${presetId.toString()}/Use/$sessionId');
    var response = await _dio.post(url.toString(),
        data: null, options: Options(contentType: ContentType.JSON));

    return true;
  }

  Future<Map<String, List<BrandGroup>>> getGearBrans() async {
    var url = Uri.https(baseUrl, '/api/Gear/Brands');
    var response = await _dio.get(url.toString());
    var result = Map<String, List<BrandGroup>>();
    for (var key in response.data.keys) {
      print(key);
      var list = response.data[key] as List<dynamic>;
      var brands = list.map((f) {
        var brandMap = f as Map<String, dynamic>;
        var brand = BrandGroup.fromJson(brandMap);
        return brand;
      }).toList();

      result[key] = brands;
    }

    return result;
  }

  Future<PlaceMenuDto> getPlaceMenu(int id) async {
    var url = Uri.https(baseUrl, '/api/Places/${id}/Menu');
    return await _dio.get(url.toString()).then((data) {
      return PlaceMenuDto.fromJson(data.data);
    });
  }

  Future<PlaceDto> getPlaceInfo(int id) async {
    var url = Uri.https(baseUrl, '/api/Places/${id}/Menu');
    return await _dio
        .get(url.toString())
        .then((data) => PlaceDto.fromJson(data.data));
  }

  Future restartDevice(String id) async {
    var url = Uri.https(baseUrl, '/api/Device/${id}/Restart');
    return await _dio.post(url.toString());
  }

  Future sleepDevice(String id) async {
    var url = Uri.https(baseUrl, '/api/Device/${id}/Sleep');
    return await _dio.post(url.toString());
  }
}

class ColorDto {
  final HSVColor color;

  ColorDto(this.color);

  Map<String, dynamic> toJson() => {
        'Hue': ((color.hue / 360) * 255).round(),
        'Saturation': (color.saturation * 255).round(),
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
