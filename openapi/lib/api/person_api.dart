part of openapi.api;



class PersonApi {
  final ApiClient apiClient;

  PersonApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<PersonActiveDataDto> personGetPersonActiveData() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/Person/GetPersonActiveData".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
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
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'PersonActiveDataDto') as PersonActiveDataDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<PipeAccesorySimpleDto>> personMyGear({ String type }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/Person/MyGear".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(type != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "type", type));
    }

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
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
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return (apiClient.deserialize(response.body, 'List<PipeAccesorySimpleDto>') as List).map((item) => item as PipeAccesorySimpleDto).toList();
    } else {
      return null;
    }
  }
}
