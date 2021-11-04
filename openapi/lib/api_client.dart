//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({this.basePath = 'https://devmana.azurewebsites.net'});

  final String basePath;

  var _client = Client();

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  ///
  /// If the [newClient] is null, an [ArgumentError] is thrown.
  set client(Client newClient) {
    if (newClient == null) {
      throw ArgumentError('New client instance cannot be null.');
    }
    _client = newClient;
  }

  final _defaultHeaderMap = <String, String>{};
  final _authentications = <String, Authentication>{};

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  /// Returns an unmodifiable [Map] of the authentications, since none should be added
  /// or deleted.
  Map<String, Authentication> get authentications =>
      Map.unmodifiable(_authentications);

  T getAuthentication<T extends Authentication>(String name) {
    final authentication = _authentications[name];
    return authentication is T ? authentication : null;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    Iterable<QueryParam> queryParams,
    Object body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String nullableContentType,
    List<String> authNames,
  ) async {
    _updateParamsForAuth(authNames, queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);

    final urlEncodedQueryParams = queryParams
        .where((param) => param.value != null)
        .map((param) => '$param');

    final queryString = urlEncodedQueryParams.isNotEmpty
        ? '?${urlEncodedQueryParams.join('&')}'
        : '';

    final url = '$basePath$path$queryString';

    if (nullableContentType != null) {
      headerParams['Content-Type'] = nullableContentType;
    }

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (body is MultipartFile &&
          (nullableContentType == null ||
              !nullableContentType
                  .toLowerCase()
                  .startsWith('multipart/form-data'))) {
        final request = StreamedRequest(method, Uri.parse(url));
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
              request.sink.add,
              onDone: request.sink.close,
              onError: (error, trace) => request.sink.close(),
              cancelOnError: true,
            );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, Uri.parse(url));
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = nullableContentType == 'application/x-www-form-urlencoded'
          ? formParams
          : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch (method) {
        case 'POST':
          return await _client.post(
            Uri.parse(url),
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PUT':
          return await _client.put(
            Uri.parse(url),
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'DELETE':
          return await _client.delete(
            Uri.parse(url),
            headers: nullableHeaderParams,
          );
        case 'PATCH':
          return await _client.patch(
            Uri.parse(url),
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'HEAD':
          return await _client.head(
            Uri.parse(url),
            headers: nullableHeaderParams,
          );
        case 'GET':
          return await _client.get(
            Uri.parse(url),
            headers: nullableHeaderParams,
          );
      }
    } on SocketException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        e,
        trace,
      );
    } on TlsException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        e,
        trace,
      );
    } on IOException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        e,
        trace,
      );
    } on ClientException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        e,
        trace,
      );
    } on Exception catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        e,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(String json, String targetType,
          {bool growable}) async =>
      // ignore: deprecated_member_use_from_same_package
      deserialize(json, targetType, growable: growable);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(String json, String targetType, {bool growable}) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType =
        targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
        ? json
        : _deserialize(jsonDecode(json), targetType,
            growable: growable == true);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object value) async => serialize(value);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object value) => value == null ? '' : json.encode(value);

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(
    List<String> authNames,
    List<QueryParam> queryParams,
    Map<String, String> headerParams,
  ) {
    authNames.forEach((authName) {
      final auth = _authentications[authName];
      if (auth == null) {
        throw ArgumentError('Authentication undefined: $authName');
      }
      auth.applyToParams(queryParams, headerParams);
    });
  }

  static dynamic _deserialize(dynamic value, String targetType,
      {bool growable}) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
          break;
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'ActionSettings':
          return ActionSettings.fromJson(value);
        case 'AddressDto':
          return AddressDto.fromJson(value);
        case 'Animations':
          return Animations.fromJson(value);
        case 'BrandDto':
          return BrandDto.fromJson(value);
        case 'BrandGroupDto':
          return BrandGroupDto.fromJson(value);
        case 'BusinessHoursDto':
          return BusinessHoursDto.fromJson(value);
        case 'DeviceDevicePictureDto':
          return DeviceDevicePictureDto.fromJson(value);
        case 'DevicePresetDto':
          return DevicePresetDto.fromJson(value);
        case 'DeviceSettingDto':
          return DeviceSettingDto.fromJson(value);
        case 'DeviceSimpleDto':
          return DeviceSimpleDto.fromJson(value);
        case 'DeviceUpdateDto':
          return DeviceUpdateDto.fromJson(value);
        case 'DeviceUpdateInfoDto':
          return DeviceUpdateInfoDto.fromJson(value);
        case 'Dto':
          return Dto.fromJson(value);
        case 'DynamicSmokeStatisticRawDto':
          return DynamicSmokeStatisticRawDto.fromJson(value);
        case 'FeatureMixCreatorDto':
          return FeatureMixCreatorDto.fromJson(value);
        case 'FeatureMixCreatorSimpleDto':
          return FeatureMixCreatorSimpleDto.fromJson(value);
        case 'FinishedSessionDataDto':
          return FinishedSessionDataDto.fromJson(value);
        case 'FranchiseDto':
          return FranchiseDto.fromJson(value);
        case 'GamePictureDto':
          return GamePictureDto.fromJson(value);
        case 'GameProfileSimpleDto':
          return GameProfileSimpleDto.fromJson(value);
        case 'GearTobaccoReviewDetailDto':
          return GearTobaccoReviewDetailDto.fromJson(value);
        case 'GearTobaccoReviewDto':
          return GearTobaccoReviewDto.fromJson(value);
        case 'HookahOrderDto':
          return HookahOrderDto.fromJson(value);
        case 'InitDataDto':
          return InitDataDto.fromJson(value);
        case 'InlineResponse200':
          return InlineResponse200.fromJson(value);
        case 'MediaDto':
          return MediaDto.fromJson(value);
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
        case 'PlacesPlaceReviewDto':
          return PlacesPlaceReviewDto.fromJson(value);
        case 'PlacesReservationsReservationDetailDto':
          return PlacesReservationsReservationDetailDto.fromJson(value);
        case 'PlacesReservationsReservationDto':
          return PlacesReservationsReservationDto.fromJson(value);
        case 'PlacesReservationsReservationManageDto':
          return PlacesReservationsReservationManageDto.fromJson(value);
        case 'PriceGroupItems':
          return PriceGroupItems.fromJson(value);
        case 'ReservationsTimeSlot':
          return ReservationsTimeSlot.fromJson(value);
        case 'SearchPipeAccessory':
          return SearchPipeAccessory.fromJson(value);
        case 'SeatDto':
          return SeatDto.fromJson(value);
        case 'SmartHookahControllersApiDeviceInfoResponse':
          return SmartHookahControllersApiDeviceInfoResponse.fromJson(value);
        case 'SmartHookahControllersPriceGroupDto':
          return SmartHookahControllersPriceGroupDto.fromJson(value);
        case 'SmartHookahHelpersAnimation':
          return SmartHookahHelpersAnimation.fromJson(value);
        case 'SmartHookahModelsDbColor':
          return SmartHookahModelsDbColor.fromJson(value);
        case 'SmartHookahModelsDbPuf':
          return SmartHookahModelsDbPuf.fromJson(value);
        case 'SmartHookahModelsDbSessionDtoSessionPlaceReviewDto':
          return SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(
              value);
        case 'SmartHookahModelsDbSessionDtoSessionReviewDto':
          return SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(value);
        case 'SmartHookahModelsDbSocialMedia':
          return SmartHookahModelsDbSocialMedia.fromJson(value);
        case 'SmartHookahModelsForgotPasswordViewModel':
          return SmartHookahModelsForgotPasswordViewModel.fromJson(value);
        case 'SmartHookahModelsOrderExtraDto':
          return SmartHookahModelsOrderExtraDto.fromJson(value);
        case 'SmartHookahModelsParameterObjectsChangeAnimation':
          return SmartHookahModelsParameterObjectsChangeAnimation.fromJson(
              value);
        case 'SmartHookahModelsParameterObjectsChangeBrightness':
          return SmartHookahModelsParameterObjectsChangeBrightness.fromJson(
              value);
        case 'SmartHookahModelsParameterObjectsChangeColor':
          return SmartHookahModelsParameterObjectsChangeColor.fromJson(value);
        case 'SmartHookahModelsParameterObjectsChangeSpeed':
          return SmartHookahModelsParameterObjectsChangeSpeed.fromJson(value);
        case 'SmartHookahModelsRedisCompetitionEntry':
          return SmartHookahModelsRedisCompetitionEntry.fromJson(value);
        case 'SmartHookahServicesGearTobaccoFilter':
          return SmartHookahServicesGearTobaccoFilter.fromJson(value);
        case 'SmartHookahServicesPlaceReservationUsageDto':
          return SmartHookahServicesPlaceReservationUsageDto.fromJson(value);
        case 'SmokeSessionMetaDataDto':
          return SmokeSessionMetaDataDto.fromJson(value);
        case 'SmokeSessionSimpleDto':
          return SmokeSessionSimpleDto.fromJson(value);
        case 'SmokeSessionStatisticsDto':
          return SmokeSessionStatisticsDto.fromJson(value);
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
          Match match;
          if (value is List &&
              (match = _regList.firstMatch(targetType)) != null) {
            targetType = match[1]; // ignore: parameter_assignments
            return value
                .map((v) => _deserialize(v, targetType, growable: growable))
                .toList(growable: growable);
          }
          if (value is Set &&
              (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match[1]; // ignore: parameter_assignments
            return value
                .map((v) => _deserialize(v, targetType, growable: growable))
                .toSet();
          }
          if (value is Map &&
              (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match[1]; // ignore: parameter_assignments
            return Map.fromIterables(
              value.keys,
              value.values
                  .map((v) => _deserialize(v, targetType, growable: growable)),
            );
          }
          break;
      }
    } catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.internalServerError,
        'Exception during deserialization.',
        error,
        trace,
      );
    }
    throw ApiException(
      HttpStatus.internalServerError,
      'Could not find a suitable class for deserialization',
    );
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    @required this.json,
    @required this.targetType,
    this.growable,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
      ? message.json
      : ApiClient._deserialize(
          jsonDecode(message.json),
          targetType,
          growable: message.growable == true,
        );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object value) async =>
    value == null ? '' : json.encode(value);
