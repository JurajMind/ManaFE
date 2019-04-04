part of openapi.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {

  String basePath;
  var client = Client();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _regList = RegExp(r'^List<(.*)>$');
  final _regMap = RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: "https://localhost:44324"}) {
    // Setup authentications (key: authentication name, value: authentication).
  }

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'ActionSettings':
          return ActionSettings.fromJson(value);
        case 'AddressDto':
          return AddressDto.fromJson(value);
        case 'Animations':
          return Animations.fromJson(value);
        case 'BrandGroupDto':
          return BrandGroupDto.fromJson(value);
        case 'BusinessHoursDto':
          return BusinessHoursDto.fromJson(value);
        case 'DevicePresetDto':
          return DevicePresetDto.fromJson(value);
        case 'DeviceSettingDto':
          return DeviceSettingDto.fromJson(value);
        case 'DeviceSimpleDto':
          return DeviceSimpleDto.fromJson(value);
        case 'Dto':
          return Dto.fromJson(value);
        case 'DynamicSmokeStatisticRawDto':
          return DynamicSmokeStatisticRawDto.fromJson(value);
        case 'FranchiseDto':
          return FranchiseDto.fromJson(value);
        case 'GamePictureDto':
          return GamePictureDto.fromJson(value);
        case 'GameProfileSimpleDto':
          return GameProfileSimpleDto.fromJson(value);
        case 'HookahOrderDto':
          return HookahOrderDto.fromJson(value);
        case 'InitDataDto':
          return InitDataDto.fromJson(value);
        case 'InlineResponse200':
          return InlineResponse200.fromJson(value);
        case 'MediaDto':
          return MediaDto.fromJson(value);
        case 'MixCreator':
          return MixCreator.fromJson(value);
        case 'MixCreatorsDto':
          return MixCreatorsDto.fromJson(value);
        case 'NearbyPlacesDto':
          return NearbyPlacesDto.fromJson(value);
        case 'PersonActiveDataDto':
          return PersonActiveDataDto.fromJson(value);
        case 'PersonInfoDto':
          return PersonInfoDto.fromJson(value);
        case 'PersonStatisticsOverallDto':
          return PersonStatisticsOverallDto.fromJson(value);
        case 'PipeAccesoryLikeDto':
          return PipeAccesoryLikeDto.fromJson(value);
        case 'PipeAccesorySimpleDto':
          return PipeAccesorySimpleDto.fromJson(value);
        case 'PipeAccessoryDetailsDto':
          return PipeAccessoryDetailsDto.fromJson(value);
        case 'PipeAccessoryStatisticsDto':
          return PipeAccessoryStatisticsDto.fromJson(value);
        case 'PipeAccessoryUsageDto':
          return PipeAccessoryUsageDto.fromJson(value);
        case 'PlaceCalendarDto':
          return PlaceCalendarDto.fromJson(value);
        case 'PlaceDay':
          return PlaceDay.fromJson(value);
        case 'PlaceDto':
          return PlaceDto.fromJson(value);
        case 'PlaceEvent':
          return PlaceEvent.fromJson(value);
        case 'PlaceEventCollection':
          return PlaceEventCollection.fromJson(value);
        case 'PlaceMenuDto':
          return PlaceMenuDto.fromJson(value);
        case 'PlaceSimpleDto':
          return PlaceSimpleDto.fromJson(value);
        case 'PlacesDevicePlaceDashboardDto':
          return PlacesDevicePlaceDashboardDto.fromJson(value);
        case 'PlacesPlaceDashboardDto':
          return PlacesPlaceDashboardDto.fromJson(value);
        case 'PriceGroupItems':
          return PriceGroupItems.fromJson(value);
        case 'ReservationDetailDto':
          return ReservationDetailDto.fromJson(value);
        case 'ReservationDto':
          return ReservationDto.fromJson(value);
        case 'ReservationManageDto':
          return ReservationManageDto.fromJson(value);
        case 'ReservationsTimeSlot':
          return ReservationsTimeSlot.fromJson(value);
        case 'SearchPipeAccessory':
          return SearchPipeAccessory.fromJson(value);
        case 'SeatDto':
          return SeatDto.fromJson(value);
        case 'SmartHookahControllersPriceGroupDto':
          return SmartHookahControllersPriceGroupDto.fromJson(value);
        case 'SmartHookahHelpersAnimation':
          return SmartHookahHelpersAnimation.fromJson(value);
        case 'SmartHookahModelsDbColor':
          return SmartHookahModelsDbColor.fromJson(value);
        case 'SmartHookahModelsDbPuf':
          return SmartHookahModelsDbPuf.fromJson(value);
        case 'SmartHookahModelsForgotPasswordViewModel':
          return SmartHookahModelsForgotPasswordViewModel.fromJson(value);
        case 'SmartHookahModelsOrderExtraDto':
          return SmartHookahModelsOrderExtraDto.fromJson(value);
        case 'SmartHookahModelsParameterObjectsChangeAnimation':
          return SmartHookahModelsParameterObjectsChangeAnimation.fromJson(value);
        case 'SmartHookahModelsParameterObjectsChangeBrightness':
          return SmartHookahModelsParameterObjectsChangeBrightness.fromJson(value);
        case 'SmartHookahModelsParameterObjectsChangeColor':
          return SmartHookahModelsParameterObjectsChangeColor.fromJson(value);
        case 'SmartHookahModelsParameterObjectsChangeSpeed':
          return SmartHookahModelsParameterObjectsChangeSpeed.fromJson(value);
        case 'SmartHookahServicesGearTobaccoFilter':
          return SmartHookahServicesGearTobaccoFilter.fromJson(value);
        case 'SmartHookahServicesPlaceReservationUsageDto':
          return SmartHookahServicesPlaceReservationUsageDto.fromJson(value);
        case 'SmokeSessionMetaDataDto':
          return SmokeSessionMetaDataDto.fromJson(value);
        case 'SmokeSessionSimpleDto':
          return SmokeSessionSimpleDto.fromJson(value);
        case 'SmokeSessionTimeStatisticsDto':
          return SmokeSessionTimeStatisticsDto.fromJson(value);
        case 'TobaccoDto':
          return TobaccoDto.fromJson(value);
        case 'TobaccoInMix':
          return TobaccoInMix.fromJson(value);
        case 'TobaccoInformationDto':
          return TobaccoInformationDto.fromJson(value);
        case 'TobaccoMixSimpleDto':
          return TobaccoMixSimpleDto.fromJson(value);
        case 'TobaccoReviewDto':
          return TobaccoReviewDto.fromJson(value);
        case 'TobaccoSimpleDto':
          return TobaccoSimpleDto.fromJson(value);
        case 'TobaccoTasteDto':
          return TobaccoTasteDto.fromJson(value);
        case 'UsedWithDto':
          return UsedWithDto.fromJson(value);
        case 'UserModel':
          return UserModel.fromJson(value);
        case 'Validation':
          return Validation.fromJson(value);
        default:
          {
            Match match;
            if (value is List &&
                (match = _regList.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return value.map((v) => _deserialize(v, newTargetType)).toList();
            } else if (value is Map &&
                (match = _regMap.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType)));
            }
          }
      }
    } on Exception catch (e, stack) {
      throw ApiException.withInner(500, 'Exception during deserialization.', e, stack);
    }
    throw ApiException(500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String json, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return json;

    var decodedJson = jsonDecode(json);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(String path,
                             String method,
                             Iterable<QueryParam> queryParams,
                             Object body,
                             Map<String, String> headerParams,
                             Map<String, String> formParams,
                             String contentType,
                             List<String> authNames) async {

    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams.where((p) => p.value != null).map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ?
                         '?' + ps.join('&') :
                         '';

    String url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if(body is MultipartRequest) {
      var request = MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded" ? formParams : serialize(body);
      switch(method) {
        case "POST":
          return client.post(url, headers: headerParams, body: msgBody);
        case "PUT":
          return client.put(url, headers: headerParams, body: msgBody);
        case "DELETE":
          return client.delete(url, headers: headerParams);
        case "PATCH":
          return client.patch(url, headers: headerParams, body: msgBody);
        default:
          return client.get(url, headers: headerParams);
      }
    }
  }

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames, List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication auth = _authentications[authName];
      if (auth == null) throw ArgumentError("Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is OAuth) {
        auth.setAccessToken(accessToken);
      }
    });
  }
}
