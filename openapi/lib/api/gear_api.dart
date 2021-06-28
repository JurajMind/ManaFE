//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class GearApi {
  GearApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/Gear/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PipeAccesorySimpleDto] accessory (required):
  Future<Response> gearAddGearWithHttpInfo(PipeAccesorySimpleDto accessory) async {
    // Verify required params are set.
    if (accessory == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: accessory');
    }

    final path = r'/api/Gear/Add';

    Object postBody = accessory;

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
  /// * [PipeAccesorySimpleDto] accessory (required):
  Future<PipeAccesorySimpleDto> gearAddGear(PipeAccesorySimpleDto accessory) async {
    final response = await gearAddGearWithHttpInfo(accessory);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PipeAccesorySimpleDto',) as PipeAccesorySimpleDto;
        }
    return Future<PipeAccesorySimpleDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Gear/Brand/{brandName}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] brandName (required):
  Future<Response> gearGetBrandWithHttpInfo(String brandName) async {
    // Verify required params are set.
    if (brandName == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: brandName');
    }

    final path = r'/api/Gear/Brand/{brandName}'
      .replaceAll('{' + 'brandName' + '}', brandName.toString());

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
  /// * [String] brandName (required):
  Future<BrandDto> gearGetBrand(String brandName) async {
    final response = await gearGetBrandWithHttpInfo(brandName);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BrandDto',) as BrandDto;
        }
    return Future<BrandDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Gear/Brands' operation and returns the [Response].
  Future<Response> gearGetBrandsWithHttpInfo() async {
    final path = r'/api/Gear/Brands';

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

  Future<InlineResponse200> gearGetBrands() async {
    final response = await gearGetBrandsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'InlineResponse200',) as InlineResponse200;
        }
    return Future<InlineResponse200>.value(null);
  }

  /// Performs an HTTP 'GET /api/Gear/Brands/{prefix}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] prefix (required):
  Future<Response> gearGetBrandsPrefixWithHttpInfo(String prefix) async {
    // Verify required params are set.
    if (prefix == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: prefix');
    }

    final path = r'/api/Gear/Brands/{prefix}'
      .replaceAll('{' + 'prefix' + '}', prefix.toString());

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
  /// * [String] prefix (required):
  Future<List<String>> gearGetBrandsPrefix(String prefix) async {
    final response = await gearGetBrandsPrefixWithHttpInfo(prefix);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<String>') as List)
        .cast<String>()
        .toList(growable: false);
    }
    return Future<List<String>>.value(null);
  }

  /// Performs an HTTP 'GET /api/Gear/{id}/Detail' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> gearGetDetailsWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Gear/{id}/Detail'
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
  Future<PipeAccessoryDetailsDto> gearGetDetails(int id) async {
    final response = await gearGetDetailsWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PipeAccessoryDetailsDto',) as PipeAccessoryDetailsDto;
        }
    return Future<PipeAccessoryDetailsDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Gear/{id}/Info' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> gearInfoWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Gear/{id}/Info'
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
  Future<PipeAccesorySimpleDto> gearInfo(int id) async {
    final response = await gearInfoWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PipeAccesorySimpleDto',) as PipeAccesorySimpleDto;
        }
    return Future<PipeAccesorySimpleDto>.value(null);
  }

  /// Performs an HTTP 'POST /api/Gear/Merge' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] targetId (required):
  ///
  /// * [int] sourceId (required):
  Future<Response> gearMergeWithHttpInfo(int targetId, int sourceId) async {
    // Verify required params are set.
    if (targetId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: targetId');
    }
    if (sourceId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: sourceId');
    }

    final path = r'/api/Gear/Merge';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'targetId', targetId));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'sourceId', sourceId));

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
  /// * [int] targetId (required):
  ///
  /// * [int] sourceId (required):
  Future<PipeAccesorySimpleDto> gearMerge(int targetId, int sourceId) async {
    final response = await gearMergeWithHttpInfo(targetId, sourceId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PipeAccesorySimpleDto',) as PipeAccesorySimpleDto;
        }
    return Future<PipeAccesorySimpleDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Gear/Search/{search}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] search (required):
  ///
  /// * [String] type:
  ///
  /// * [int] page:
  ///
  /// * [int] pageSize:
  ///
  /// * [String] searchType:
  Future<Response> gearSearchWithHttpInfo(String search, { String type, int page, int pageSize, String searchType }) async {
    // Verify required params are set.
    if (search == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: search');
    }

    final path = r'/api/Gear/Search/{search}'
      .replaceAll('{' + 'search' + '}', search.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (type != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'type', type));
    }
    if (page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'page', page));
    }
    if (pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'pageSize', pageSize));
    }
    if (searchType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'searchType', searchType));
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
  /// * [String] search (required):
  ///
  /// * [String] type:
  ///
  /// * [int] page:
  ///
  /// * [int] pageSize:
  ///
  /// * [String] searchType:
  Future<List<SearchPipeAccessory>> gearSearch(String search, { String type, int page, int pageSize, String searchType }) async {
    final response = await gearSearchWithHttpInfo(search,  type: type, page: page, pageSize: pageSize, searchType: searchType );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<SearchPipeAccessory>') as List)
        .cast<SearchPipeAccessory>()
        .toList(growable: false);
    }
    return Future<List<SearchPipeAccessory>>.value(null);
  }

  /// Performs an HTTP 'GET /api/Gear/{id}/Sessions' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  Future<Response> gearSessionsWithHttpInfo(int id, { int pageSize, int page }) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Gear/{id}/Sessions'
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
  Future<List<SmokeSessionSimpleDto>> gearSessions(int id, { int pageSize, int page }) async {
    final response = await gearSessionsWithHttpInfo(id,  pageSize: pageSize, page: page );
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

  /// Performs an HTTP 'POST /api/Gear/{id}/Vote' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [int] value (required):
  Future<Response> gearVoteWithHttpInfo(int id, int value) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }
    if (value == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: value');
    }

    final path = r'/api/Gear/{id}/Vote'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody = value;

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
  /// * [int] id (required):
  ///
  /// * [int] value (required):
  Future<Object> gearVote(int id, int value) async {
    final response = await gearVoteWithHttpInfo(id, value);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
        }
    return Future<Object>.value(null);
  }
}
