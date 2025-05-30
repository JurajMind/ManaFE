import 'dart:async';
import 'dart:io';

import 'package:alice_lightweight/alice.dart';
import 'package:app/main.dart';
import 'package:app/models/App/Gear/gear_model.dart';
import 'package:app/models/SmokeSession/smoke_session.dart';
import 'package:app/models/Stand/deviceSetting.dart';
import 'package:app/models/Stand/preset.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:openapi/openapi.dart';

import 'auth_helpers/auth_token_inceptor.dart';
import 'model_extensions.dart';

class ApiClient {
  final Dio _dio;

  final String baseUrl;

  ApiClient(
    url,
  )   : baseUrl = url,
        _dio = new Dio(new BaseOptions(
          baseUrl: url,
          connectTimeout: 20000,
        ));

  Future<dynamic> _getJson(Uri uri) async {
    print(uri.toString());
    Response response;
    response = await _dio.getUri(uri);
    return response.data;
  }

  void init() {
    _dio.interceptors.add(AuthTokenInceptor(_dio));
    _dio.interceptors.add(getIt.get<Alice>().getDioInterceptor());
  }

  Future<List<TobaccoMixSimpleDto>> fetchtobacoMix(
      {int page: 0, bool featured: false, int pageSize: 10, String? author}) async {
    var mixUrl = '/api/Mixology/GetMixes';
    var featureUrl = 'api/FeatureMix/Mixes/$author';
    var params = Map<String, String>();
    params['page'] = page.toString();
    params['pageSize'] = pageSize.toString();
    params['orderBy'] = 'created';
    params['order'] = 'dsc';
    if (author != null) {
      params['author'] = author;
    }
    if (featured) {
      mixUrl = featureUrl;
    } else if (author != null) {
      params['author'] = author;
    }
    {}
    var url = Uri.https(baseUrl, mixUrl, params);

    return _getJson(url).then((json) => ListHelper.tobaccoMixSimpleDtoToList(json).toList());
  }

  Future<List<TobaccoMixSimpleDto>> suggestMix(List<int?> ids,
      {String? name, int page: 0, bool featured: false, int pageSize: 10, String? author}) async {
    var mixUrl = '/api/Mixology/Search/Mix';
    var params = Map<String, String>();
    params['pageSize'] = pageSize.toString();
    params['page'] = page.toString();
    if (name != null) {
      params['name'] = name;
    }

    var url = Uri.https(baseUrl, mixUrl, params);
    var paramUrl = addParamList(url.toString(), "ids", ids);
    return _dio.get(paramUrl).then((json) => ListHelper.tobaccoMixSimpleDtoToList(json.data).toList());
  }

  String addParamList(String url, String key, List<dynamic> value) {
    var result = url.toString();
    value.forEach((f) {
      result += '&$key=${f.toString()}';
    });
    return result;
  }

  Future<List<FeatureMixCreatorSimpleDto>> getMixCreator() async {
    var url = Uri.https(baseUrl, '/api/FeatureMix/FeatureCreators');
    return _getJson(url).then((json) => ListHelper.featureMixCreatorSimpleDtoToList(json));
  }

  Future<SessionIdValidation> validateSessionId(String sessionId) {
    var url = Uri.https(baseUrl, 'api/SmokeSession/Validate', {"id": sessionId});

    return _getJson(url).then((json) => SessionIdValidation.fromJson(json));
  }

  Future<SmokeSessionWrapper> getInitData(String? sessionId) {
    var url = Uri.https(baseUrl, 'api/SmokeSession/InitData', {"id": sessionId});
    return _getJson(url).then((json) {
      var result = SmokeSessionWrapper();
      result.setting = StandSettings.fromJson(json['DeviceSettings'] as Map<String, dynamic>);
      result.session = SmokeSession.fromJson(json['SmokeSession'] as Map<String, dynamic>);
      var i = InitDataDto.fromJson(json);
      result.dtoSession = i.smokeSession;
      return result;
    });
  }

  Future<List<PlaceSimpleDto>> getNearbyPlaces({double? lat, double? lng}) {
    Map<String, String?> queryParameters = new Map<String, String?>();
    if (lat != null && lng != null) {
      queryParameters['lat'] = lat == -200 ? null : lat.toString();
      queryParameters['lng'] = lng == -200 ? null : lng.toString();
      queryParameters['page'] = '0';
      queryParameters['pageSize'] = '100';
      queryParameters['radius'] = '50';
    }
    var uri = Uri.https(baseUrl, 'api/Places/SearchNearby', queryParameters);

    return _getJson(uri).then((json) {
      var list = json['NearbyPlaces'] as List;

      return list.map((f) {
        return PlaceSimpleDto.fromJson(f);
      }).toList();
    });
  }

  Future changeColor(String? deviceId, HSVColor color, SmokeState type) async {
    var uri = Uri.https(baseUrl, 'api/Device/$deviceId/ChangeColor');

    var data = {'Color': ColorDto(color), 'Type': SmokeState.values.indexOf(type)};
    print('color ${ColorDto(color).toJson()}');
    await _dio.post(
      uri.toString(),
      data: data,
    );
  }

  Future<bool> changeAnimation(int? animationId, SmokeState type, String? deviceId) async {
    print('ChangeAnimation{$animationId} $type');
    var uri = Uri.https(baseUrl, 'api/Device/$deviceId/ChangeAnimation');
    var data = {'AnimationId': animationId, 'Type': SmokeState.values.indexOf(type)};
    var response = await _dio.post(
      uri.toString(),
      data: data,
    );
    debugPrint(response.data.toString());
    return true;
  }

  Future<bool> changeSpeed(int speed, SmokeState type, String? deviceId) async {
    debugPrint('Change speed $speed $type');
    var uri = Uri.https(baseUrl, 'api/Device/$deviceId/ChangeSpeed');
    var data = {'Speed': speed.toString(), 'Type': SmokeState.values.indexOf(type)};
    var response = await _dio.post(
      uri.toString(),
      data: data,
    );
    debugPrint(response.data.toString());
    return true;
  }

  Future<bool> changeBrightness(int brightness, SmokeState type, String? deviceId) async {
    debugPrint('Change brghtness $brightness $type');
    var uri = Uri.https(baseUrl, 'api/Device/$deviceId/ChangeBrightness');
    var data = {'Brightness': brightness.toString(), 'Type': SmokeState.values.indexOf(type)};
    var response = await _dio.post(
      uri.toString(),
      data: data,
    );
    debugPrint(response.data.toString());
    return true;
  }

  Future<List<SmartHookahHelpersAnimation>> getAnimations(String? code) {
    var url = Uri.https(baseUrl, 'api/Animations/GetAnimations', {"id": code});

    return _getJson(url)
        .then((json) => json['Animations'])
        .then((data) => ListHelper.smartHookahHelpersAnimationToList(data).toList());
  }

  Future<List<PipeAccesorySimpleDto>> searchGear(String search, String type, int page, int pageSize,
      {String searchType = "All"}) {
    var url = Uri.https(baseUrl, 'api/Gear/Search/$search',
        {"page": page.toString(), "pageSize": pageSize.toString(), "searchType": searchType, "type": fixType(type)});

    return _getJson(url).then((json) {
      return json.map<PipeAccesorySimpleDto>((data) => PipeAccesorySimpleDto.fromJson(data)).toList();
    });
  }

  String fixType(String oldType) {
    switch (oldType.toLowerCase()) {
      case 'bowl':
        return 'Bowl';
      case 'coal':
        return 'Coal';
      case 'coals':
        return 'Coal';
      case 'heatmanagement':
        return 'HeatManagment';
      case 'heatmanagment':
        return 'HeatManagment';
      case 'h.m.s':
        return 'HeatManagment';
      case 'tobacco':
        return 'Tobacco';
      case 'hookah':
        return 'Pipe';
        break;
      case 'pipe':
        return 'Pipe';
    }
    return oldType;
  }

  Future<String?> getSessionId(String id) async {
    var url = Uri.https(baseUrl, 'api/SmokeSession/GetSessionCode', {"id": id});
    var result = await _dio.get(url.toString());
    return result.data;
  }

  Future<List<PipeAccesorySimpleDto>> getMyGear() async {
    var url = Uri.https(baseUrl, 'api/Person/MyGear');
    return _getJson(url).then((data) => ListHelper.pipeAccesorySimpleDtoToList(data));
  }

  Future<PersonActiveDataDto> getPersonInitData() async {
    var url = Uri.https(baseUrl, 'api/Person/InitData');
    return _getJson(url).then((data) => PersonActiveDataDto.fromJson(data));
  }

  Future<List<SmokeSessionSimpleDto>> getPersonSessions() async {
    var url = Uri.https(baseUrl, 'api/Person/Sessions');
    return _getJson(url).then((data) => ListHelper.smokeSessionSimpleDtoToList(data));
  }

  Future<SmokeSessionMetaDataDto> postMetadata(String? sessionCode, SmokeSessionMetaDataDto value) async {
    var url = Uri.https(baseUrl, 'api/SmokeSession/$sessionCode/SaveMetaData');

    var response = await _dio.post(
      url.toString(),
      data: value.toJson(),
    );
    debugPrint(response.data.toString());
    return SmokeSessionMetaDataDto.fromJson(response.data);
  }

  Future<List<DevicePreset>> getDevicePresets() async {
    var url = Uri.https(baseUrl, 'api/Device/Preset/GetUserPresets');
    return _getJson(url).then((data) => data.map<DevicePreset>((p) => DevicePreset.fromJson(p)).toList());
  }

  Future<bool> setDevicePreset(String? sessionId, int? presetId) async {
    print('Set preset on session {$sessionId}:${presetId.toString()}');
    var url = Uri.https(baseUrl, '/api/Device/Preset/${presetId.toString()}/Use/$sessionId');
    await _dio.post(
      url.toString(),
      data: null,
    );

    return true;
  }

  Future<Map<String?, List<BrandGroup>>> getGearBrans() async {
    var url = Uri.https(baseUrl, '/api/Gear/Brands');
    var response = await _dio.get(url.toString());
    var result = Map<String?, List<BrandGroup>>();
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

  Future<PipeAccesorySimpleDto> getGearInfo(int? id) async {
    var url = Uri.https(baseUrl, 'api/Gear/$id/Info');
    return _getJson(url).then((data) => PipeAccesorySimpleDto.fromJson(data));
  }

  Future<PlaceMenuDto> getPlaceMenu(int? id) async {
    var url = Uri.https(baseUrl, '/api/Places/$id/Menu');
    return await _dio.get(url.toString()).then((data) {
      return PlaceMenuDto.fromJson(data.data);
    });
  }

  Future<SmartHookahServicesPlaceReservationUsageDto> getPlaceReservationInfo(int? id, DateTime? date) async {
    var url = Uri.https(baseUrl, '/api/Reservations/$id/Usage');
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(date ?? DateTime.now());
    return await _dio.get(url.toString(), queryParameters: {'date': formatted}).then((data) {
      return SmartHookahServicesPlaceReservationUsageDto.fromJson(data.data);
    });
  }

  Future<PlacesReservationsReservationManageDto> manageReservation(int? id, DateTime date) async {
    var url = Uri.https(baseUrl, '/api/Reservations/$id/Manage');
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(date);
    return await _dio.get(url.toString(), queryParameters: {'date': formatted}).then((data) {
      return PlacesReservationsReservationManageDto.fromJson(data.data);
    });
  }

  Future<PlacesReservationsReservationDto> addLateReservation(int? id, int time) async {
    var url = Uri.https(baseUrl, '/api/Reservations/$id/AddLateTime');
    return await _dio.post(url.toString(), data: time).then((data) {
      return PlacesReservationsReservationDto.fromJson(data.data);
    });
  }

  Future<PlaceDto> getPlaceInfo(int? id) async {
    var url = Uri.https(baseUrl, '/api/Places/GetPlaceInfo/', {"id": id.toString()});
    return await _dio.get(url.toString()).then((data) => PlaceDto.fromJson(data.data));
  }

  Future restartDevice(String? id) async {
    var url = Uri.https(baseUrl, '/api/Device/$id/Restart');
    return await _dio.post(url.toString());
  }

  Future pingDevice(String? id) async {
    var url = Uri.https(baseUrl, '/api/Device/$id/Ping');
    return await _dio.post(url.toString());
  }

  Future sleepDevice(String? id) async {
    var url = Uri.https(baseUrl, '/api/Device/$id/Sleep');
    return await _dio.post(url.toString());
  }

  Future<TobaccoMixSimpleDto> saveMix(TobaccoMixSimpleDto? mix) async {
    var url = Uri.https(baseUrl, '/api/Mixology/AddToMix');
    var result = await _dio.post(url.toString(), data: mix);
    return TobaccoMixSimpleDto.fromJson(result.data);
  }

  Future deleteMix(TobaccoMixSimpleDto mix) async {
    var url = Uri.https(baseUrl, '/api/Mixology/RemoveMix', {'mixId': mix.id.toString()});
    await _dio.deleteUri(url);
  }

  Future<PersonStatisticsOverallDto> getStatistic(DateTime from, DateTime to) async {
    final f = new DateFormat('yyyy-MM-dd');
    var url = Uri.https(baseUrl, '/api/Statistics/GetStatistics', {'from': f.format(from), 'to': f.format(to)});

    return await _dio.getUri(url).then((data) => PersonStatisticsOverallDto.fromJson(data.data));
  }

  Future<List<PlacesReservationsReservationDto>> getReservations(DateTime from, DateTime to) async {
    final f = new DateFormat('yyyy-MM-dd');
    var url = Uri.https(baseUrl, '/api/Reservations/Reservations', {'from': f.format(from), 'to': f.format(to)});

    return await _dio.getUri(url).then((data) => ListHelper.placesReservationsReservationDtoToList(data.data));
  }

  Future<PlacesReservationsReservationDto> createReservation(PlacesReservationsReservationDto newReservation) async {
    var url = Uri.https(baseUrl, '/api/Reservations/Create');
    var data = await _dio.post(url.toString(), data: newReservation);
    data.data['Created'] = null;
    return PlacesReservationsReservationDto.fromJson(data.data);
  }

  Future<PlacesReservationsReservationDetailDto> detailReservation(int id) async {
    var url = Uri.https(baseUrl, '/api/Reservations/$id/Detail');
    var data = await _dio.get(url.toString());
    return PlacesReservationsReservationDetailDto.fromJson(data.data);
  }

  Future<PipeAccesorySimpleDto> addMyGear(int? id, int count) async {
    Map<String, String> params = new Map<String, String>();
    //params['count'] = count.toString();
    var url = Uri.https(baseUrl, '/api/Person/MyGear/$id/Add', params);
    return await _dio.postUri(url).then((data) => PipeAccesorySimpleDto.fromJson(data.data));
  }

  Future<bool> removeMyGear(int? id) async {
    Map<String, String> params = new Map<String, String>();
    // params['count'] = '0';
    var url = Uri.https(baseUrl, '/api/Person/MyGear/$id/Delete', params);
    return await _dio.postUri(url).then((data) => true);
  }

  Future<PersonInfoDto> getPersonInfo() async {
    var url = Uri.https(baseUrl, '/api/Person/Info');
    return await _dio.getUri(url).then((data) => PersonInfoDto.fromJson(data.data));
  }

  Future updateNotificationToken(String? token) async {
    var url = Uri.https(baseUrl, '/api/Person/NotificationToken', {'token': token});
    await _dio.putUri(url);
  }

  Future testNotification() async {
    var url = Uri.https(baseUrl, '/api/Person/TestNotification');
    await _dio.post(url.toString());
  }

  Future<PlacesReservationsReservationDetailDto> reservationDetail(int? id) async {
    var url = Uri.https(baseUrl, '/api/Reservations/$id/Detail');
    return await _dio.getUri(url).then((data) => PlacesReservationsReservationDetailDto.fromJson(data.data));
  }

  Future cancelReservation(int? id) async {
    var url = Uri.https(baseUrl, '/api/Reservations/$id/UpdateState');
    return await _dio.post(url.toString(), data: 1);
  }

  Future<List<SmartHookahModelsDbPuf>> getPufs(int? id) async {
    var url = Uri.https(baseUrl, '/api/SmokeSession/GetPufs', {'id': id.toString()});
    return await _dio.getUri(url).then((data) => ListHelper.smartHookahModelsDbPufToList(data.data).toList());
  }

  Future<FinishedSessionDataDto> getFinishedData(int? id) async {
    var url = Uri.https(baseUrl, '/api/SmokeSession/GetFinishedData', {'id': id.toString()});
    return await _dio.getUri(url).then((data) => FinishedSessionDataDto.fromJson(data.data));
  }

  Future<SmokeSessionSimpleDto> endSession(String? id) async {
    var url = Uri.https(baseUrl, '/api/SmokeSession/$id/End');
    return await _dio.postUri(url).then((data) => SmokeSessionSimpleDto.fromJson(data.data));
  }

  Future<bool> changeMixName(int? id, String name) async {
    var url = Uri.https(baseUrl, '/api/Mixology/RenameMix/$id', {'newName': name});
    return await _dio.postUri(url).then((onValue) => true).catchError((_) => false);
  }

  Future<bool> addCompetitionEntry(String name, double time) async {
    var url = Uri.https(baseUrl, '/api/Competition/Add', {'name': name, 'time': time.toString()});
    return await _dio.postUri(url).then((onValue) => true).catchError((_) => false);
  }

  Future<List<SmartHookahModelsRedisCompetitionEntry>> getCompetitionResult() async {
    var url = Uri.https(baseUrl, '/api/Competition/Results');
    return await _dio.getUri(url).then((data) => ListHelper.smartHookahModelsRedisCompetitionEntryToList(data.data));
  }

  Future<SmartHookahControllersApiDeviceInfoResponse> getDeviceInfo(int? id) async {
    var url = Uri.https(baseUrl, '/api/Device/$id/Info');
    return await _dio.getUri(url).then((data) => SmartHookahControllersApiDeviceInfoResponse.fromJson(data.data));
  }

  Future<List<DeviceDevicePictureDto>> getDevicePicutres() async {
    var url = Uri.https(baseUrl, '/api/Device/Pictures');
    return await _dio.getUri(url).then((data) => ListHelper.deviceDevicePictureDtoToList(data.data));
  }

  Future<bool> changeDevicePicture(int? deviceId, int? pictureId) async {
    var url = Uri.https(baseUrl, '/api/Device/$deviceId/SetPicture');
    return await _dio.post(url.toString(), data: pictureId).then((data) => data.data);
  }

  Future<List<DeviceUpdateDto>> getUpdates() async {
    var url = Uri.https(baseUrl, '/api/Device/Updates');
    return await _dio.getUri(url).then((data) => ListHelper.deviceUpdateDtoToList(data.data));
  }

  Future<bool> pushUpdate(int? deviceId, int? updateId) async {
    var url = Uri.https(baseUrl, '/api/Device/$deviceId/Update/$updateId');
    return await _dio.postUri(url).then((data) => data.data);
  }

  Future<PlaceDto> addPlace(PlaceDto newPlace) async {
    var url = Uri.https(baseUrl, '/api/Places/Add');
    return await _dio.postUri(url, data: newPlace).then((data) => PlaceDto.fromJson(data.data));
  }

  Future<PipeAccesorySimpleDto> addGear(PipeAccesorySimpleDto newGear) async {
    var url = Uri.https(baseUrl, '/api/Gear/Add');
    return await _dio.postUri(url, data: newGear).then((data) => PipeAccesorySimpleDto.fromJson(data.data));
  }

  Future<PlaceDto> uploadPlacePicture(int? placeId, File file, {ValueChanged<double>? progress}) async {
    var url = Uri.https(baseUrl, '/api/Media/Place/$placeId/Add');

    FormData formData = new FormData.fromMap({
      "file": MultipartFile.fromBytes(file.readAsBytesSync(), filename: "picture.jpg"),
    });

    return await _dio.postUri(
      url,
      data: formData,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
        if (progress != null) {
          progress(total / sent);
        }
      },
    ).then((data) => PlaceDto.fromJson(data.data));
  }

  Future<PipeAccesorySimpleDto> uploadGearPicture(int gearId, File file) async {
    var url = Uri.https(baseUrl, '/api/Media/Gear/$gearId/Add');

    FormData formData = new FormData.fromMap({
      "file": MultipartFile.fromBytes(file.readAsBytesSync(), filename: "picture.jpg"),
    });

    return await _dio.postUri(
      url,
      data: formData,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
    ).then((data) => PipeAccesorySimpleDto.fromJson(data.data));
  }

  Future<MediaDto> uploadSessionReviewFile(int? reviewId, File file) async {
    var url = Uri.https(baseUrl, '/api/Media/SessionReview/$reviewId/Add');

    FormData formData = new FormData.fromMap({
      "file": MultipartFile.fromBytes(file.readAsBytesSync(), filename: "picture.jpg"),
    });

    return await _dio.postUri(
      url,
      data: formData,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
    ).then((data) {
      if (data.data['Created'] != null) {
        data.data['Created'] = DateTime.now().toString();
      }
      return MediaDto.fromJson(data.data);
    });
  }

  Future<MediaDto> uploadPlaceReviewFile(int? reviewId, File file) async {
    var url = Uri.https(baseUrl, '/api/Media/PlaceReview/$reviewId/Add');

    FormData formData = new FormData.fromMap({
      "file": MultipartFile.fromBytes(file.readAsBytesSync(), filename: "picture.jpg"),
    });

    return await _dio.postUri(
      url,
      data: formData,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
    ).then((data) => MediaDto.fromJson(data.data));
  }

  Future<DeviceSimpleDto> addDevice(String id, String name, String code) async {
    Map<String, String> params = new Map<String, String>();
    params['code'] = code;
    params['newName'] = name;
    var url = Uri.https(baseUrl, '/api/Device/$id/Add', params);
    return await _dio.postUri(url).then((data) => DeviceSimpleDto.fromJson(data.data));
  }

  Future<DeviceSimpleDto> removeDevice(
    String? id,
  ) async {
    var url = Uri.https(baseUrl, '/api/Device/$id/Remove');
    return await _dio.deleteUri(url).then((data) => DeviceSimpleDto.fromJson(data.data));
  }

  Future<DeviceSimpleDto> changeDeviceName(String? id, String name) async {
    Map<String, String> params = new Map<String, String>();
    params['newName'] = name;
    var url = Uri.https(baseUrl, '/api/Device/$id/ChangeName');
    return await _dio.postUri(url).then((data) => DeviceSimpleDto.fromJson(data.data));
  }

  Future<bool> voteMix(int? id, int value) async {
    var url = Uri.https(baseUrl, '/api/Mixology/$id/Vote');
    return await _dio.postUri(url, data: value).then((data) => true);
  }

  Future<FeatureMixCreatorDto> getFeatureCreatorInfo(int? id) async {
    var url = Uri.https(baseUrl, '/api/FeatureMix/FeatureCreator/$id');
    return await _dio
        .get(
          url.toString(),
        )
        .then((data) => FeatureMixCreatorDto.fromJson(data.data));
  }

  Future<List<PlacesPlaceReviewDto>> getPlaceReview(int? id, {int pageSize = 10, page = 0}) async {
    var url = Uri.https(baseUrl, '/api/Review/Place/$id');
    return await _dio.get(url.toString(), queryParameters: {"pageSize": pageSize, "page": page}).then(
        (data) => ListHelper.placesPlaceReviewDtoToList(data.data));
  }

  Future<PlacesPlaceReviewDto> addPlaceReview(int? id, PlacesPlaceReviewDto review) async {
    var url = Uri.https(baseUrl, '/api/Review/Place/$id');
    return await _dio.post(url.toString(), data: review).then((data) {
      if (data.data['publishDate'] != null) {
        data.data['publishDate'] = DateTime.now().toString();
      }
      return PlacesPlaceReviewDto.fromJson(data.data);
    });
  }

  Future<SmartHookahModelsDbSessionDtoSessionReviewDto> addSessionReview(
      SmartHookahModelsDbSessionDtoSessionReviewDto review) async {
    var url = Uri.https(baseUrl, '/api/Review/Session/${review.smokeSessionId}');
    return await _dio.post(url.toString(), data: review).then((data) {
      if (data.data['publishDate'] != null) {
        data.data['publishDate'] = DateTime.now().toString();
        if (data.data['tobaccoReview'] != null) {
          data.data['tobaccoReview']['publishDate'] = DateTime.now().toString();
        }
        if (data.data['placeReview'] != null) {
          data.data['placeReview']['publishDate'] = DateTime.now().toString();
          if (data.data['placeReview']['sessionReview'] != null)
            data.data['placeReview']['sessionReview']['publishDate'] = DateTime.now().toString();
        }
      }
      return SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(data.data);
    });
  }

  Future<List<SmartHookahModelsDbSessionDtoSessionReviewDto>> getSessionReview(int? id,
      {int pageSize = 10, page = 0}) async {
    var url = Uri.https(baseUrl, '/api/Review/Session/$id');
    return await _dio.get(url.toString(), queryParameters: {"pageSize": pageSize, "page": page}).then(
        (data) => ListHelper.smartHookahModelsDbSessionDtoSessionReviewDtoToList(data.data));
  }

  Future<bool> removeSessionReview(int? id, {int pageSize = 10, page = 0}) async {
    var url = Uri.https(baseUrl, '/api/Review/Session/$id');
    return await _dio.delete(url.toString()).then((data) => data.statusCode == 200);
  }

  Future<List<GearTobaccoReviewDto>> getTobaccoReview(int id, {int pageSize = 10, page = 0}) async {
    var url = Uri.https(baseUrl, '/api/Review/Tobacco/$id');
    return await _dio.get(url.toString(), queryParameters: {"pageSize": pageSize, "page": page}).then(
        (data) => ListHelper.gearTobaccoReviewDtoToList(data.data));
  }

  Future<TobaccoInformationDto> getTobaccoInfo(
    int? id,
  ) async {
    var url = Uri.https(baseUrl, '/api/Tobacco/$id/GetAllInfo');
    return await _dio.get(url.toString()).then((data) => TobaccoInformationDto.fromJson(data.data));
  }

  Future<TobaccoMixSimpleDto> getTobaccoMix(
    int? id,
  ) async {
    var url = Uri.https(baseUrl, '/api/Mixology/$id/GetMix');
    return await _dio.get(url.toString()).then((data) => TobaccoMixSimpleDto.fromJson(data.data));
  }

  Future<List<TobaccoMixSimpleDto>> getTobaccoInMix(int? id, {int pageSize = 10, page = 0}) async {
    var url = Uri.https(
      baseUrl,
      '/api/Tobacco/$id/InMix',
    );
    return await _dio.get(url.toString(), queryParameters: {"pageSize": pageSize, "page": page}).then(
        (data) => ListHelper.tobaccoMixSimpleDtoToList(data.data));
  }

  Future<List<SmokeSessionSimpleDto>> getGearSession(int? id, {int pageSize = 10, page = 0}) async {
    var url = Uri.https(
      baseUrl,
      '/api/Gear/$id/Sessions',
    );
    return await _dio.get(url.toString(), queryParameters: {"pageSize": pageSize, "page": page}).then(
        (data) => ListHelper.smokeSessionSimpleDtoToList(data.data));
  }

  Future<List<SmokeSessionSimpleDto>> getDeviceSessions(int? id, {int page = 0, int pageSize = 10}) async {
    var url = Uri.https(
      baseUrl,
      '/api/Device/$id/Sessions',
    );
    return await _dio.get(url.toString(), queryParameters: {"pageSize": pageSize, "page": page}).then(
        (data) => ListHelper.smokeSessionSimpleDtoToList(data.data));
  }

  Future<SmokeSessionSimpleDto> assignSession(int? id) async {
    var url = Uri.https(
      baseUrl,
      '/api/Person/AssignSession/$id',
    );
    return await _dio.post(url.toString()).then((data) => SmokeSessionSimpleDto.fromJson(data.data));
  }

  Future<bool> unAssignSession(int? id) async {
    var url = Uri.https(
      baseUrl,
      '/api/Person/UnAssignSession/$id',
    );
    var data = await _dio
        .postUri(
      url,
      data: null,
    )
        .then((data) {
      return true;
    });
    return data;
  }
}

class ColorDto {
  final HSVColor color;

  ColorDto(this.color);

  Map<String, dynamic> toJson() =>
      {'Hue': ((color.hue / 360) * 255).round(), 'Saturation': (color.saturation * 255).round(), 'Value': 255};
}

class SessionIdValidation extends Dto {
  final String? id;
  final SessionState? state;
  SessionIdValidation({this.id, this.state}) : super();

  SessionIdValidation.fromJson(Map<String, dynamic> map)
      : id = map["Id"],
        state = SessionState.values[map["Flag"]];
}

class Dto {
  final bool? success;
  final String? message;
  final int? httpResponseCode;

  Dto({this.success, this.message, this.httpResponseCode});

  Dto.fromJson(Map<String, dynamic> map)
      : success = map["Success"],
        message = map["Message"],
        httpResponseCode = map["HttpResponseCode"];
}

enum SessionState { live, completed }
