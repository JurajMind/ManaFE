//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PlaceCalendarApi {
  PlaceCalendarApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/PlaceCalendar/CreateEventFromFacebook' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] url (required):
  Future<Response> placeCalendarCreatePlaceEventFromFacebookWithHttpInfo(String url) async {
    // Verify required params are set.
    if (url == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: url');
    }

    final path = r'/api/PlaceCalendar/CreateEventFromFacebook';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'url', url));

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [String] url (required):
  Future<Dto> placeCalendarCreatePlaceEventFromFacebook(String url) async {
    final response = await placeCalendarCreatePlaceEventFromFacebookWithHttpInfo(url);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dto',) as Dto;
        }
    return Future<Dto>.value(null);
  }

  /// Performs an HTTP 'DELETE /api/PlaceCalendar/DeletePlaceDay' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] dayId (required):
  Future<Response> placeCalendarDeletePlaceDayWithHttpInfo(int dayId) async {
    // Verify required params are set.
    if (dayId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: dayId');
    }

    final path = r'/api/PlaceCalendar/DeletePlaceDay';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'dayId', dayId));

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [int] dayId (required):
  Future<Dto> placeCalendarDeletePlaceDay(int dayId) async {
    final response = await placeCalendarDeletePlaceDayWithHttpInfo(dayId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dto',) as Dto;
        }
    return Future<Dto>.value(null);
  }

  /// Performs an HTTP 'DELETE /api/PlaceCalendar/DeletePlaceEvent' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  Future<Response> placeCalendarDeletePlaceEventWithHttpInfo(int eventId) async {
    // Verify required params are set.
    if (eventId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId');
    }

    final path = r'/api/PlaceCalendar/DeletePlaceEvent';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventId', eventId));

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [int] eventId (required):
  Future<Dto> placeCalendarDeletePlaceEvent(int eventId) async {
    final response = await placeCalendarDeletePlaceEventWithHttpInfo(eventId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dto',) as Dto;
        }
    return Future<Dto>.value(null);
  }

  /// Performs an HTTP 'GET /api/PlaceCalendar/FindEventsBy' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] placeId (required):
  ///
  /// * [DateTime] startsAfter (required):
  ///
  /// * [DateTime] endsBefore (required):
  ///
  /// * [String] privacyType:
  Future<Response> placeCalendarFindEventsByWithHttpInfo(int placeId, DateTime startsAfter, DateTime endsBefore, { String privacyType }) async {
    // Verify required params are set.
    if (placeId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: placeId');
    }
    if (startsAfter == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: startsAfter');
    }
    if (endsBefore == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: endsBefore');
    }

    final path = r'/api/PlaceCalendar/FindEventsBy';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'placeId', placeId));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'startsAfter', startsAfter));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'endsBefore', endsBefore));
    if (privacyType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'privacyType', privacyType));
    }

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [int] placeId (required):
  ///
  /// * [DateTime] startsAfter (required):
  ///
  /// * [DateTime] endsBefore (required):
  ///
  /// * [String] privacyType:
  Future<PlaceEventCollection> placeCalendarFindEventsBy(int placeId, DateTime startsAfter, DateTime endsBefore, { String privacyType }) async {
    final response = await placeCalendarFindEventsByWithHttpInfo(placeId, startsAfter, endsBefore,  privacyType: privacyType );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PlaceEventCollection',) as PlaceEventCollection;
        }
    return Future<PlaceEventCollection>.value(null);
  }

  /// Performs an HTTP 'GET /api/PlaceCalendar/GetCalendar' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] placeId (required):
  ///
  /// * [String] privacyType:
  Future<Response> placeCalendarGetPlaceCalendarWithHttpInfo(int placeId, { String privacyType }) async {
    // Verify required params are set.
    if (placeId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: placeId');
    }

    final path = r'/api/PlaceCalendar/GetCalendar';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'placeId', placeId));
    if (privacyType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'privacyType', privacyType));
    }

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [int] placeId (required):
  ///
  /// * [String] privacyType:
  Future<PlaceCalendarDto> placeCalendarGetPlaceCalendar(int placeId, { String privacyType }) async {
    final response = await placeCalendarGetPlaceCalendarWithHttpInfo(placeId,  privacyType: privacyType );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PlaceCalendarDto',) as PlaceCalendarDto;
        }
    return Future<PlaceCalendarDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/PlaceCalendar/GetPlaceDay' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] placeId (required):
  ///
  /// * [int] dayId (required):
  ///
  /// * [DateTime] dayDate (required):
  ///
  /// * [String] privacyType:
  Future<Response> placeCalendarGetPlaceDayWithHttpInfo(int placeId, int dayId, DateTime dayDate, { String privacyType }) async {
    // Verify required params are set.
    if (placeId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: placeId');
    }
    if (dayId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: dayId');
    }
    if (dayDate == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: dayDate');
    }

    final path = r'/api/PlaceCalendar/GetPlaceDay';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'placeId', placeId));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'dayId', dayId));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'dayDate', dayDate));
    if (privacyType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'privacyType', privacyType));
    }

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [int] placeId (required):
  ///
  /// * [int] dayId (required):
  ///
  /// * [DateTime] dayDate (required):
  ///
  /// * [String] privacyType:
  Future<PlaceDay> placeCalendarGetPlaceDay(int placeId, int dayId, DateTime dayDate, { String privacyType }) async {
    final response = await placeCalendarGetPlaceDayWithHttpInfo(placeId, dayId, dayDate,  privacyType: privacyType );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PlaceDay',) as PlaceDay;
        }
    return Future<PlaceDay>.value(null);
  }

  /// Performs an HTTP 'GET /api/PlaceCalendar/GetPlaceEvent' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] eventId (required):
  Future<Response> placeCalendarGetPlaceEventWithHttpInfo(int eventId) async {
    // Verify required params are set.
    if (eventId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId');
    }

    final path = r'/api/PlaceCalendar/GetPlaceEvent';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventId', eventId));

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [int] eventId (required):
  Future<PlaceEvent> placeCalendarGetPlaceEvent(int eventId) async {
    final response = await placeCalendarGetPlaceEventWithHttpInfo(eventId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PlaceEvent',) as PlaceEvent;
        }
    return Future<PlaceEvent>.value(null);
  }

  /// Performs an HTTP 'POST /api/PlaceCalendar/SavePlaceDay' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PlaceDay] placeDay (required):
  Future<Response> placeCalendarSavePlaceDayWithHttpInfo(PlaceDay placeDay) async {
    // Verify required params are set.
    if (placeDay == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: placeDay');
    }

    final path = r'/api/PlaceCalendar/SavePlaceDay';

    Object postBody = placeDay;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json', 'text/json', 'application/xml', 'text/xml', 'multipart/form-data', 'application/x-www-form-urlencoded'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [PlaceDay] placeDay (required):
  Future<Dto> placeCalendarSavePlaceDay(PlaceDay placeDay) async {
    final response = await placeCalendarSavePlaceDayWithHttpInfo(placeDay);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dto',) as Dto;
        }
    return Future<Dto>.value(null);
  }

  /// Performs an HTTP 'POST /api/PlaceCalendar/SavePlaceEvent' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PlaceEvent] placeEvent (required):
  Future<Response> placeCalendarSavePlaceEventWithHttpInfo(PlaceEvent placeEvent) async {
    // Verify required params are set.
    if (placeEvent == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: placeEvent');
    }

    final path = r'/api/PlaceCalendar/SavePlaceEvent';

    Object postBody = placeEvent;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json', 'text/json', 'application/xml', 'text/xml', 'multipart/form-data', 'application/x-www-form-urlencoded'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Parameters:
  ///
  /// * [PlaceEvent] placeEvent (required):
  Future<Dto> placeCalendarSavePlaceEvent(PlaceEvent placeEvent) async {
    final response = await placeCalendarSavePlaceEventWithHttpInfo(placeEvent);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Dto',) as Dto;
        }
    return Future<Dto>.value(null);
  }
}
