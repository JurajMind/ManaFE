part of openapi.api;



class StatisticsApi {
  final ApiClient apiClient;

  StatisticsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<PersonStatisticsOverallDto> statisticsGetStatistics(DateTime from, DateTime to) async {
    Object postBody;

    // verify required params are set
    if(from == null) {
     throw new ApiException(400, "Missing required param: from");
    }
    if(to == null) {
     throw new ApiException(400, "Missing required param: to");
    }

    // create path and map variables
    String path = "/api/Statistics/GetStatistics".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "from", from));
      queryParams.addAll(_convertParametersForCollectionFormat("", "to", to));

    List<String> contentTypes = [];

    String contentType = contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'PersonStatisticsOverallDto') as PersonStatisticsOverallDto;
    } else {
      return null;
    }
  }
}
