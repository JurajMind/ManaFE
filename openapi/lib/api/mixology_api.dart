//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MixologyApi {
  MixologyApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/Mixology/AddToMix' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [TobaccoMixSimpleDto] newMix (required):
  Future<Response> mixologyAddToMixWithHttpInfo(TobaccoMixSimpleDto newMix) async {
    // Verify required params are set.
    if (newMix == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: newMix');
    }

    final path = r'/api/Mixology/AddToMix';

    Object postBody = newMix;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json', 'text/json', 'application/x-www-form-urlencoded'];
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
  /// * [TobaccoMixSimpleDto] newMix (required):
  Future<TobaccoMixSimpleDto> mixologyAddToMix(TobaccoMixSimpleDto newMix) async {
    final response = await mixologyAddToMixWithHttpInfo(newMix);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TobaccoMixSimpleDto',) as TobaccoMixSimpleDto;
        }
    return Future<TobaccoMixSimpleDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Mixology/Suggest/Mix' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [List<int>] ids (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  ///
  /// * [bool] own:
  Future<Response> mixologyGetMiFromTobaccosWithHttpInfo(List<int> ids, { int pageSize, int page, bool own }) async {
    // Verify required params are set.
    if (ids == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: ids');
    }

    final path = r'/api/Mixology/Suggest/Mix';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('multi', 'ids', ids));
    if (pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'pageSize', pageSize));
    }
    if (page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'page', page));
    }
    if (own != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'own', own));
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
  /// * [List<int>] ids (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  ///
  /// * [bool] own:
  Future<List<TobaccoMixSimpleDto>> mixologyGetMiFromTobaccos(List<int> ids, { int pageSize, int page, bool own }) async {
    final response = await mixologyGetMiFromTobaccosWithHttpInfo(ids,  pageSize: pageSize, page: page, own: own );
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

  /// Performs an HTTP 'GET /api/Mixology/GetMixes' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] page:
  ///
  /// * [int] pageSize:
  ///
  /// * [String] author:
  ///
  /// * [String] orderBy:
  ///
  /// * [String] order:
  Future<Response> mixologyGetMixesWithHttpInfo({ int page, int pageSize, String author, String orderBy, String order }) async {
    // Verify required params are set.

    final path = r'/api/Mixology/GetMixes';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'page', page));
    }
    if (pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'pageSize', pageSize));
    }
    if (author != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'author', author));
    }
    if (orderBy != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'orderBy', orderBy));
    }
    if (order != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'order', order));
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
  /// * [int] page:
  ///
  /// * [int] pageSize:
  ///
  /// * [String] author:
  ///
  /// * [String] orderBy:
  ///
  /// * [String] order:
  Future<List<TobaccoMixSimpleDto>> mixologyGetMixes({ int page, int pageSize, String author, String orderBy, String order }) async {
    final response = await mixologyGetMixesWithHttpInfo( page: page, pageSize: pageSize, author: author, orderBy: orderBy, order: order );
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

  /// Performs an HTTP 'GET /api/Mixology/{id}/GetMix' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> mixologyGetTobaccoMixWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Mixology/{id}/GetMix'
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
  Future<TobaccoMixSimpleDto> mixologyGetTobaccoMix(int id) async {
    final response = await mixologyGetTobaccoMixWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TobaccoMixSimpleDto',) as TobaccoMixSimpleDto;
        }
    return Future<TobaccoMixSimpleDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Mixology/{id}/GetTastes' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> mixologyGetTobaccoMixTastesWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Mixology/{id}/GetTastes'
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
  Future<Map<String, List<TobaccoTasteDto>>> mixologyGetTobaccoMixTastes(int id) async {
    final response = await mixologyGetTobaccoMixTastesWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return Map<String, List<TobaccoTasteDto>>.from(await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Map<String, List<TobaccoTasteDto>>'),);
    }
    return Future<Map<String, List<TobaccoTasteDto>>>.value(null);
  }

  /// Performs an HTTP 'DELETE /api/Mixology/RemoveMix' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] mixId (required):
  Future<Response> mixologyRemoveMixWithHttpInfo(int mixId) async {
    // Verify required params are set.
    if (mixId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: mixId');
    }

    final path = r'/api/Mixology/RemoveMix';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'mixId', mixId));

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
  /// * [int] mixId (required):
  Future<Dto> mixologyRemoveMix(int mixId) async {
    final response = await mixologyRemoveMixWithHttpInfo(mixId);
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

  /// Performs an HTTP 'POST /api/Mixology/RenameMix/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [String] newName (required):
  Future<Response> mixologyRenameMixWithHttpInfo(int id, String newName) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }
    if (newName == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: newName');
    }

    final path = r'/api/Mixology/RenameMix/{id}'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'newName', newName));

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
  /// * [int] id (required):
  ///
  /// * [String] newName (required):
  Future<TobaccoMixSimpleDto> mixologyRenameMix(int id, String newName) async {
    final response = await mixologyRenameMixWithHttpInfo(id, newName);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TobaccoMixSimpleDto',) as TobaccoMixSimpleDto;
        }
    return Future<TobaccoMixSimpleDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Mixology/Suggest/Tobacco' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [List<int>] ids (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  ///
  /// * [bool] own:
  Future<Response> mixologySuggestMixTobaccoWithHttpInfo(List<int> ids, { int pageSize, int page, bool own }) async {
    // Verify required params are set.
    if (ids == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: ids');
    }

    final path = r'/api/Mixology/Suggest/Tobacco';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('multi', 'ids', ids));
    if (pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'pageSize', pageSize));
    }
    if (page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'page', page));
    }
    if (own != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'own', own));
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
  /// * [List<int>] ids (required):
  ///
  /// * [int] pageSize:
  ///
  /// * [int] page:
  ///
  /// * [bool] own:
  Future<List<TobaccoSimpleDto>> mixologySuggestMixTobacco(List<int> ids, { int pageSize, int page, bool own }) async {
    final response = await mixologySuggestMixTobaccoWithHttpInfo(ids,  pageSize: pageSize, page: page, own: own );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<TobaccoSimpleDto>') as List)
        .cast<TobaccoSimpleDto>()
        .toList(growable: false);
    }
    return Future<List<TobaccoSimpleDto>>.value(null);
  }

  /// Performs an HTTP 'POST /api/Mixology/{id}/Vote' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [int] value (required):
  Future<Response> mixologyVoteWithHttpInfo(int id, int value) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }
    if (value == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: value');
    }

    final path = r'/api/Mixology/{id}/Vote'
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
  Future<Object> mixologyVote(int id, int value) async {
    final response = await mixologyVoteWithHttpInfo(id, value);
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
