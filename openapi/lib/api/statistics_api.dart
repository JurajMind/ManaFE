//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatisticsApi {
  StatisticsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/Statistics/GetStatistics' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [DateTime] from (required):
  ///
  /// * [DateTime] to (required):
  Future<Response> statisticsGetStatisticsWithHttpInfo(DateTime from, DateTime to) async {
    // Verify required params are set.
    if (from == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: from');
    }
    if (to == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: to');
    }

    final path = r'/api/Statistics/GetStatistics';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'from', from));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'to', to));

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
  /// * [DateTime] from (required):
  ///
  /// * [DateTime] to (required):
  Future<PersonStatisticsOverallDto> statisticsGetStatistics(DateTime from, DateTime to) async {
    final response = await statisticsGetStatisticsWithHttpInfo(from, to);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PersonStatisticsOverallDto',) as PersonStatisticsOverallDto;
        }
    return Future<PersonStatisticsOverallDto>.value(null);
  }
}
