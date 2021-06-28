//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TobaccoApi {
  TobaccoApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/Tobacco/{id}/GetTobacco' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> tobaccoGetTobaccoWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Tobacco/{id}/GetTobacco'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] id (required):
  Future<TobaccoSimpleDto> tobaccoGetTobacco(int id) async {
    final response = await tobaccoGetTobaccoWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TobaccoSimpleDto',) as TobaccoSimpleDto;
        }
    return Future<TobaccoSimpleDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Tobacco/{id}/InMix' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  Future<Response> tobaccoGetTobaccoInMixesWithHttpInfo(int id, { int pageSize, int page }) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Tobacco/{id}/InMix'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'pageSize', pageSize));
    }
    if (page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'page', page));
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
  /// * [int] id (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  Future<List<TobaccoMixSimpleDto>> tobaccoGetTobaccoInMixes(int id, { int pageSize, int page }) async {
    final response = await tobaccoGetTobaccoInMixesWithHttpInfo(id,  pageSize: pageSize, page: page );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<TobaccoMixSimpleDto>') as List)
        .cast<TobaccoMixSimpleDto>()
        .toList(growable: false);
    }
    return Future<List<TobaccoMixSimpleDto>>.value(null);
  }

  /// Performs an HTTP 'GET /api/Tobacco/{id}/GetAllInfo' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> tobaccoGetTobaccoInfoWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Tobacco/{id}/GetAllInfo'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] id (required):
  Future<TobaccoInformationDto> tobaccoGetTobaccoInfo(int id) async {
    final response = await tobaccoGetTobaccoInfoWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TobaccoInformationDto',) as TobaccoInformationDto;
        }
    return Future<TobaccoInformationDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Tobacco/{id}/GetStatistics' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> tobaccoGetTobaccoSatisticsWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Tobacco/{id}/GetStatistics'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] id (required):
  Future<PipeAccessoryStatisticsDto> tobaccoGetTobaccoSatistics(int id) async {
    final response = await tobaccoGetTobaccoSatisticsWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PipeAccessoryStatisticsDto',) as PipeAccessoryStatisticsDto;
        }
    return Future<PipeAccessoryStatisticsDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Tobacco/{id}/GetSessions' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  Future<Response> tobaccoGetTobaccoSessionsWithHttpInfo(int id, { int pageSize, int page }) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Tobacco/{id}/GetSessions'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'pageSize', pageSize));
    }
    if (page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'page', page));
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
  /// * [int] id (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  Future<List<SmokeSessionSimpleDto>> tobaccoGetTobaccoSessions(int id, { int pageSize, int page }) async {
    final response = await tobaccoGetTobaccoSessionsWithHttpInfo(id,  pageSize: pageSize, page: page );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<SmokeSessionSimpleDto>') as List)
        .cast<SmokeSessionSimpleDto>()
        .toList(growable: false);
    }
    return Future<List<SmokeSessionSimpleDto>>.value(null);
  }

  /// Performs an HTTP 'GET /api/Tobacco/{id}/GetTaste' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> tobaccoGetTobaccoTasteWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Tobacco/{id}/GetTaste'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] id (required):
  Future<List<TobaccoTasteDto>> tobaccoGetTobaccoTaste(int id) async {
    final response = await tobaccoGetTobaccoTasteWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<TobaccoTasteDto>') as List)
        .cast<TobaccoTasteDto>()
        .toList(growable: false);
    }
    return Future<List<TobaccoTasteDto>>.value(null);
  }

  /// Performs an HTTP 'GET /api/Tobacco/search' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [List<int>] filterPeriodTastes:
  ///
  /// * [int] filterPeriodSortBy:
  ///
  /// * [String] filterPeriodBrand:
  ///
  /// * [bool] filterPeriodOwned:
  ///
  /// * [bool] filterPeriodSmoked:
  ///
  /// * [int] filterPeriodSortDirection:
  Future<Response> tobaccoSearchWithHttpInfo(int page, int pageSize, { List<int> filterPeriodTastes, int filterPeriodSortBy, String filterPeriodBrand, bool filterPeriodOwned, bool filterPeriodSmoked, int filterPeriodSortDirection }) async {
    // Verify required params are set.
    if (page == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: page');
    }
    if (pageSize == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: pageSize');
    }

    final path = r'/api/Tobacco/search';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'page', page));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'pageSize', pageSize));
    if (filterPeriodTastes != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('multi', 'filter.tastes', filterPeriodTastes));
    }
    if (filterPeriodSortBy != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'filter.sortBy', filterPeriodSortBy));
    }
    if (filterPeriodBrand != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'filter.brand', filterPeriodBrand));
    }
    if (filterPeriodOwned != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'filter.owned', filterPeriodOwned));
    }
    if (filterPeriodSmoked != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'filter.smoked', filterPeriodSmoked));
    }
    if (filterPeriodSortDirection != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'filter.sortDirection', filterPeriodSortDirection));
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
  /// * [int] page (required):
  ///
  /// * [int] pageSize (required):
  ///
  /// * [List<int>] filterPeriodTastes:
  ///
  /// * [int] filterPeriodSortBy:
  ///
  /// * [String] filterPeriodBrand:
  ///
  /// * [bool] filterPeriodOwned:
  ///
  /// * [bool] filterPeriodSmoked:
  ///
  /// * [int] filterPeriodSortDirection:
  Future<List<TobaccoDto>> tobaccoSearch(int page, int pageSize, { List<int> filterPeriodTastes, int filterPeriodSortBy, String filterPeriodBrand, bool filterPeriodOwned, bool filterPeriodSmoked, int filterPeriodSortDirection }) async {
    final response = await tobaccoSearchWithHttpInfo(page, pageSize,  filterPeriodTastes: filterPeriodTastes, filterPeriodSortBy: filterPeriodSortBy, filterPeriodBrand: filterPeriodBrand, filterPeriodOwned: filterPeriodOwned, filterPeriodSmoked: filterPeriodSmoked, filterPeriodSortDirection: filterPeriodSortDirection );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<TobaccoDto>') as List)
        .cast<TobaccoDto>()
        .toList(growable: false);
    }
    return Future<List<TobaccoDto>>.value(null);
  }
}
