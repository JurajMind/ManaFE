//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DevicePresetApi {
  DevicePresetApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'DELETE /api/Device/Preset/{id}/Delete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> devicePresetDeletePresetWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Device/Preset/{id}/Delete'
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
  /// * [int] id (required):
  Future<Object> devicePresetDeletePreset(int id) async {
    final response = await devicePresetDeletePresetWithHttpInfo(id);
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

  /// Performs an HTTP 'GET /api/Device/Preset/{id}/GetPreset' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> devicePresetGetPresetWithHttpInfo(int id) async {
    // Verify required params are set.
    if (id == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: id');
    }

    final path = r'/api/Device/Preset/{id}/GetPreset'
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
  Future<DevicePresetDto> devicePresetGetPreset(int id) async {
    final response = await devicePresetGetPresetWithHttpInfo(id);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DevicePresetDto',) as DevicePresetDto;
        }
    return Future<DevicePresetDto>.value(null);
  }

  /// Performs an HTTP 'GET /api/Device/Preset/GetUserPresets' operation and returns the [Response].
  Future<Response> devicePresetGetUserPresetsWithHttpInfo() async {
    final path = r'/api/Device/Preset/GetUserPresets';

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

  Future<List<DevicePresetDto>> devicePresetGetUserPresets() async {
    final response = await devicePresetGetUserPresetsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<DevicePresetDto>') as List)
        .cast<DevicePresetDto>()
        .toList(growable: false);
    }
    return Future<List<DevicePresetDto>>.value(null);
  }

  /// Performs an HTTP 'POST /api/Device/Preset/SavePresetFromDevice/{deviceId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] deviceId (required):
  ///
  /// * [String] name (required):
  ///
  /// * [bool] addToPerson:
  ///
  /// * [bool] setDefault:
  Future<Response> devicePresetSaveDevicePresetWithHttpInfo(String deviceId, String name, { bool addToPerson, bool setDefault }) async {
    // Verify required params are set.
    if (deviceId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: deviceId');
    }
    if (name == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: name');
    }

    final path = r'/api/Device/Preset/SavePresetFromDevice/{deviceId}'
      .replaceAll('{' + 'deviceId' + '}', deviceId.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'name', name));
    if (addToPerson != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'addToPerson', addToPerson));
    }
    if (setDefault != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'setDefault', setDefault));
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
  /// * [String] deviceId (required):
  ///
  /// * [String] name (required):
  ///
  /// * [bool] addToPerson:
  ///
  /// * [bool] setDefault:
  Future<DevicePresetDto> devicePresetSaveDevicePreset(String deviceId, String name, { bool addToPerson, bool setDefault }) async {
    final response = await devicePresetSaveDevicePresetWithHttpInfo(deviceId, name,  addToPerson: addToPerson, setDefault: setDefault );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DevicePresetDto',) as DevicePresetDto;
        }
    return Future<DevicePresetDto>.value(null);
  }

  /// Performs an HTTP 'POST /api/Device/Preset/{sessionCode}/SavePresetFromSession' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] sessionCode (required):
  ///
  /// * [String] name (required):
  ///
  /// * [bool] addToPerson:
  ///
  /// * [bool] setDefault:
  Future<Response> devicePresetSaveSessionPresetWithHttpInfo(String sessionCode, String name, { bool addToPerson, bool setDefault }) async {
    // Verify required params are set.
    if (sessionCode == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: sessionCode');
    }
    if (name == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: name');
    }

    final path = r'/api/Device/Preset/{sessionCode}/SavePresetFromSession'
      .replaceAll('{' + 'sessionCode' + '}', sessionCode.toString());

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'name', name));
    if (addToPerson != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'addToPerson', addToPerson));
    }
    if (setDefault != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'setDefault', setDefault));
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
  /// * [String] sessionCode (required):
  ///
  /// * [String] name (required):
  ///
  /// * [bool] addToPerson:
  ///
  /// * [bool] setDefault:
  Future<DevicePresetDto> devicePresetSaveSessionPreset(String sessionCode, String name, { bool addToPerson, bool setDefault }) async {
    final response = await devicePresetSaveSessionPresetWithHttpInfo(sessionCode, name,  addToPerson: addToPerson, setDefault: setDefault );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DevicePresetDto',) as DevicePresetDto;
        }
    return Future<DevicePresetDto>.value(null);
  }

  /// Performs an HTTP 'POST /api/Device/Preset/{presetId}/SetDefault' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] presetId (required):
  Future<Response> devicePresetSetDefaultWithHttpInfo(int presetId) async {
    // Verify required params are set.
    if (presetId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: presetId');
    }

    final path = r'/api/Device/Preset/{presetId}/SetDefault'
      .replaceAll('{' + 'presetId' + '}', presetId.toString());

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
  /// * [int] presetId (required):
  Future<void> devicePresetSetDefault(int presetId) async {
    final response = await devicePresetSetDefaultWithHttpInfo(presetId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /api/Device/Preset/UseDefault/{sessionId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  Future<Response> devicePresetUseDefaultWithHttpInfo(String sessionId) async {
    // Verify required params are set.
    if (sessionId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: sessionId');
    }

    final path = r'/api/Device/Preset/UseDefault/{sessionId}'
      .replaceAll('{' + 'sessionId' + '}', sessionId.toString());

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
  /// * [String] sessionId (required):
  Future<void> devicePresetUseDefault(String sessionId) async {
    final response = await devicePresetUseDefaultWithHttpInfo(sessionId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /api/Device/Preset/{presetId}/Use/{sessionId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] sessionId (required):
  ///
  /// * [int] presetId (required):
  Future<Response> devicePresetUsePresetWithHttpInfo(String sessionId, int presetId) async {
    // Verify required params are set.
    if (sessionId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: sessionId');
    }
    if (presetId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: presetId');
    }

    final path = r'/api/Device/Preset/{presetId}/Use/{sessionId}'
      .replaceAll('{' + 'sessionId' + '}', sessionId.toString())
      .replaceAll('{' + 'presetId' + '}', presetId.toString());

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
  /// * [String] sessionId (required):
  ///
  /// * [int] presetId (required):
  Future<void> devicePresetUsePreset(String sessionId, int presetId) async {
    final response = await devicePresetUsePresetWithHttpInfo(sessionId, presetId);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
