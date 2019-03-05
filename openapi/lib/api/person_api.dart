part of openapi.api;



class PersonApi {
  final ApiClient apiClient;

  PersonApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<PipeAccesorySimpleDto> personAddMyGear(int id, int count) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }
    if(count == null) {
     throw new ApiException(400, "Missing required param: count");
    }

    // create path and map variables
    String path = "/api/Person/MyGear/{id}/Add/{count}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString()).replaceAll("{" + "count" + "}", count.toString());

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
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'PipeAccesorySimpleDto') as PipeAccesorySimpleDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<bool> personDeleteMyGear(int id, int count) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }
    if(count == null) {
     throw new ApiException(400, "Missing required param: count");
    }

    // create path and map variables
    String path = "/api/Person/MyGear/{id}/Delete".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "count", count));

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
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'bool') as bool;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<PersonActiveDataDto> personGetPersonActiveData() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/Person/InitData".replaceAll("{format}","json");

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
  Future<List<DeviceSimpleDto>> personGetPersonDevices() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/Person/Devices".replaceAll("{format}","json");

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
      return (apiClient.deserialize(response.body, 'List<DeviceSimpleDto>') as List).map((item) => item as DeviceSimpleDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<PersonInfoDto> personGetPersonInfo() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/Person/Info".replaceAll("{format}","json");

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
      return apiClient.deserialize(response.body, 'PersonInfoDto') as PersonInfoDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<PipeAccesorySimpleDto>> personGetRecentAccessories(int sessionCount) async {
    Object postBody;

    // verify required params are set
    if(sessionCount == null) {
     throw new ApiException(400, "Missing required param: sessionCount");
    }

    // create path and map variables
    String path = "/api/Person/MyGear/Used/{sessionCount}".replaceAll("{format}","json").replaceAll("{" + "sessionCount" + "}", sessionCount.toString());

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
      return (apiClient.deserialize(response.body, 'List<PipeAccesorySimpleDto>') as List).map((item) => item as PipeAccesorySimpleDto).toList();
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
