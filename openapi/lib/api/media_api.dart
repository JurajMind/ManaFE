//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MediaApi {
  MediaApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/Media/Gear/{id}/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [MultipartFile] file (required):
  ///   A file
  Future<Response> mediaAddGearPictureWithHttpInfo(int id, MultipartFile file) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }
    if (file == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: file');
    }

    final path = r'/api/Media/Gear/{id}/Add'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['multipart/form-data'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (file != null) {
        hasFields = true;
        mp.fields[r'file'] = file.field;
        mp.files.add(file);
      }
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
  /// * [MultipartFile] file (required):
  ///   A file
  Future<MediaDto> mediaAddGearPicture(int id, MultipartFile file) async {
    final response = await mediaAddGearPictureWithHttpInfo(id, file);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MediaDto',) as MediaDto;
        }
    return Future<MediaDto>.value(null);
  }

  /// Performs an HTTP 'POST /api/Media/Place/{id}/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [MultipartFile] file (required):
  ///   A file
  Future<Response> mediaAddPlacePictureWithHttpInfo(int id, MultipartFile file) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }
    if (file == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: file');
    }

    final path = r'/api/Media/Place/{id}/Add'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['multipart/form-data'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (file != null) {
        hasFields = true;
        mp.fields[r'file'] = file.field;
        mp.files.add(file);
      }
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
  /// * [MultipartFile] file (required):
  ///   A file
  Future<MediaDto> mediaAddPlacePicture(int id, MultipartFile file) async {
    final response = await mediaAddPlacePictureWithHttpInfo(id, file);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MediaDto',) as MediaDto;
        }
    return Future<MediaDto>.value(null);
  }

  /// Performs an HTTP 'POST /api/Media/PlaceReview/{id}/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [MultipartFile] file (required):
  ///   A file
  Future<Response> mediaAddPlaceReviewWithHttpInfo(int id, MultipartFile file) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }
    if (file == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: file');
    }

    final path = r'/api/Media/PlaceReview/{id}/Add'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['multipart/form-data'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (file != null) {
        hasFields = true;
        mp.fields[r'file'] = file.field;
        mp.files.add(file);
      }
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
  /// * [MultipartFile] file (required):
  ///   A file
  Future<MediaDto> mediaAddPlaceReview(int id, MultipartFile file) async {
    final response = await mediaAddPlaceReviewWithHttpInfo(id, file);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MediaDto',) as MediaDto;
        }
    return Future<MediaDto>.value(null);
  }

  /// Performs an HTTP 'POST /api/Media/TobaccoReview/{id}/Add' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [MultipartFile] file (required):
  ///   A file
  Future<Response> mediaAddSessionReviewWithHttpInfo(int id, MultipartFile file) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }
    if (file == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: file');
    }

    final path = r'/api/Media/TobaccoReview/{id}/Add'
      .replaceAll('{' + 'id' + '}', id.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['multipart/form-data'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (file != null) {
        hasFields = true;
        mp.fields[r'file'] = file.field;
        mp.files.add(file);
      }
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
  /// * [MultipartFile] file (required):
  ///   A file
  Future<MediaDto> mediaAddSessionReview(int id, MultipartFile file) async {
    final response = await mediaAddSessionReviewWithHttpInfo(id, file);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MediaDto',) as MediaDto;
        }
    return Future<MediaDto>.value(null);
  }
}
