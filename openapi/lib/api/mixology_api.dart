part of openapi.api;



class MixologyApi {
  final ApiClient apiClient;

  MixologyApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<TobaccoMixSimpleDto> mixologyAddToMix(TobaccoMixSimpleDto newMix) async {
    Object postBody = newMix;

    // verify required params are set
    if(newMix == null) {
     throw new ApiException(400, "Missing required param: newMix");
    }

    // create path and map variables
    String path = "/api/Mixology/AddToMix".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json","text/json","application/x-www-form-urlencoded"];

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
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'TobaccoMixSimpleDto') as TobaccoMixSimpleDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<TobaccoMixSimpleDto>> mixologyGetMiFromTobaccos(List<int> ids, { int pageSize, int page, bool own }) async {
    Object postBody;

    // verify required params are set
    if(ids == null) {
     throw new ApiException(400, "Missing required param: ids");
    }

    // create path and map variables
    String path = "/api/Mixology/Suggest/Mix".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("multi", "ids", ids));
    if(pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    }
    if(page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
    }
    if(own != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "own", own));
    }

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
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<TobaccoMixSimpleDto>') as List).map((item) => item as TobaccoMixSimpleDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<TobaccoMixSimpleDto>> mixologyGetMixes({ int page, int pageSize, String author, String orderBy, String order }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/Mixology/GetMixes".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
    }
    if(pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    }
    if(author != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "author", author));
    }
    if(orderBy != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "orderBy", orderBy));
    }
    if(order != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "order", order));
    }

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
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<TobaccoMixSimpleDto>') as List).map((item) => item as TobaccoMixSimpleDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<TobaccoMixSimpleDto> mixologyGetTobaccoMix(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Mixology/{id}/GetMix".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

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
      return apiClient.deserialize(_decodeBodyBytes(response), 'TobaccoMixSimpleDto') as TobaccoMixSimpleDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Map<String, List<TobaccoTasteDto>>> mixologyGetTobaccoMixTastes(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Mixology/{id}/GetTastes".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

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
      return new Map<String, List<TobaccoTasteDto>>.from(apiClient.deserialize(_decodeBodyBytes(response), 'Map<String, List<TobaccoTasteDto>>'));
          ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Dto> mixologyRemoveMix(int mixId) async {
    Object postBody;

    // verify required params are set
    if(mixId == null) {
     throw new ApiException(400, "Missing required param: mixId");
    }

    // create path and map variables
    String path = "/api/Mixology/RemoveMix".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "mixId", mixId));

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
                                             'DELETE',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Dto') as Dto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<TobaccoMixSimpleDto> mixologyRenameMix(int id, String newName) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }
    if(newName == null) {
     throw new ApiException(400, "Missing required param: newName");
    }

    // create path and map variables
    String path = "/api/Mixology/RenameMix/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "newName", newName));

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
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'TobaccoMixSimpleDto') as TobaccoMixSimpleDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<TobaccoSimpleDto>> mixologySuggestMixTobacco(List<int> ids, { int pageSize, int page, bool own }) async {
    Object postBody;

    // verify required params are set
    if(ids == null) {
     throw new ApiException(400, "Missing required param: ids");
    }

    // create path and map variables
    String path = "/api/Mixology/Suggest/Tobacco".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("multi", "ids", ids));
    if(pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    }
    if(page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
    }
    if(own != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "own", own));
    }

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
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<TobaccoSimpleDto>') as List).map((item) => item as TobaccoSimpleDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Object> mixologyVote(int id, int value) async {
    Object postBody = value;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }
    if(value == null) {
     throw new ApiException(400, "Missing required param: value");
    }

    // create path and map variables
    String path = "/api/Mixology/{id}/Vote".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json","text/json","application/xml","text/xml","multipart/form-data","application/x-www-form-urlencoded"];

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
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Object') as Object;
    } else {
      return null;
    }
  }
}
