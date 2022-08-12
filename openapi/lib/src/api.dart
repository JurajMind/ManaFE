//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:openapi/src/auth/api_key_auth.dart';
import 'package:openapi/src/auth/basic_auth.dart';
import 'package:openapi/src/auth/bearer_auth.dart';
import 'package:openapi/src/auth/oauth.dart';
import 'package:openapi/src/api/account_api.dart';
import 'package:openapi/src/api/anim_api.dart';
import 'package:openapi/src/api/animation_api.dart';
import 'package:openapi/src/api/competition_api.dart';
import 'package:openapi/src/api/device_api.dart';
import 'package:openapi/src/api/device_preset_api.dart';
import 'package:openapi/src/api/end_session_api.dart';
import 'package:openapi/src/api/feature_mix_api.dart';
import 'package:openapi/src/api/gear_api.dart';
import 'package:openapi/src/api/media_api.dart';
import 'package:openapi/src/api/mixology_api.dart';
import 'package:openapi/src/api/person_api.dart';
import 'package:openapi/src/api/ping_api.dart';
import 'package:openapi/src/api/place_admin_api.dart';
import 'package:openapi/src/api/place_calendar_api.dart';
import 'package:openapi/src/api/places_api.dart';
import 'package:openapi/src/api/puf_api.dart';
import 'package:openapi/src/api/qr_code_api.dart';
import 'package:openapi/src/api/reservation_api.dart';
import 'package:openapi/src/api/review_api.dart';
import 'package:openapi/src/api/sent_to_device_api.dart';
import 'package:openapi/src/api/smoke_session_api.dart';
import 'package:openapi/src/api/stand_picture_api.dart';
import 'package:openapi/src/api/statistics_api.dart';
import 'package:openapi/src/api/tobacco_api.dart';

class Openapi {
  static const String basePath = r'https://devmana.azurewebsites.net';

  final Dio dio;
  Openapi({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : 
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: 5000,
              receiveTimeout: 3000,
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get AccountApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AccountApi getAccountApi() {
    return AccountApi(dio);
  }

  /// Get AnimApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AnimApi getAnimApi() {
    return AnimApi(dio);
  }

  /// Get AnimationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AnimationApi getAnimationApi() {
    return AnimationApi(dio);
  }

  /// Get CompetitionApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CompetitionApi getCompetitionApi() {
    return CompetitionApi(dio);
  }

  /// Get DeviceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DeviceApi getDeviceApi() {
    return DeviceApi(dio);
  }

  /// Get DevicePresetApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DevicePresetApi getDevicePresetApi() {
    return DevicePresetApi(dio);
  }

  /// Get EndSessionApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EndSessionApi getEndSessionApi() {
    return EndSessionApi(dio);
  }

  /// Get FeatureMixApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FeatureMixApi getFeatureMixApi() {
    return FeatureMixApi(dio);
  }

  /// Get GearApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GearApi getGearApi() {
    return GearApi(dio);
  }

  /// Get MediaApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MediaApi getMediaApi() {
    return MediaApi(dio);
  }

  /// Get MixologyApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MixologyApi getMixologyApi() {
    return MixologyApi(dio);
  }

  /// Get PersonApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PersonApi getPersonApi() {
    return PersonApi(dio);
  }

  /// Get PingApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PingApi getPingApi() {
    return PingApi(dio);
  }

  /// Get PlaceAdminApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PlaceAdminApi getPlaceAdminApi() {
    return PlaceAdminApi(dio);
  }

  /// Get PlaceCalendarApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PlaceCalendarApi getPlaceCalendarApi() {
    return PlaceCalendarApi(dio);
  }

  /// Get PlacesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PlacesApi getPlacesApi() {
    return PlacesApi(dio);
  }

  /// Get PufApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PufApi getPufApi() {
    return PufApi(dio);
  }

  /// Get QRCodeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  QRCodeApi getQRCodeApi() {
    return QRCodeApi(dio);
  }

  /// Get ReservationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReservationApi getReservationApi() {
    return ReservationApi(dio);
  }

  /// Get ReviewApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ReviewApi getReviewApi() {
    return ReviewApi(dio);
  }

  /// Get SentToDeviceApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SentToDeviceApi getSentToDeviceApi() {
    return SentToDeviceApi(dio);
  }

  /// Get SmokeSessionApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SmokeSessionApi getSmokeSessionApi() {
    return SmokeSessionApi(dio);
  }

  /// Get StandPictureApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StandPictureApi getStandPictureApi() {
    return StandPictureApi(dio);
  }

  /// Get StatisticsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StatisticsApi getStatisticsApi() {
    return StatisticsApi(dio);
  }

  /// Get TobaccoApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TobaccoApi getTobaccoApi() {
    return TobaccoApi(dio);
  }
}
