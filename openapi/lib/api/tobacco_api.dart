part of openapi.api;



class TobaccoApi {
  final ApiClient apiClient;

  TobaccoApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<TobaccoSimpleDto> tobaccoGetTobacco(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Tobacco/{id}/GetTobacco".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
      return apiClient.deserialize(response.body, 'TobaccoSimpleDto') as TobaccoSimpleDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<TobaccoInformationDto> tobaccoGetTobaccoInfo(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Tobacco/{id}/GetAllInfo".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
      return apiClient.deserialize(response.body, 'TobaccoInformationDto') as TobaccoInformationDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<TobaccoReviewDto>> tobaccoGetTobaccoReviews(int id, { int pageSize, int page }) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Tobacco/{id}/GetReviews".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    }
    if(page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
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
      return (apiClient.deserialize(response.body, 'List<TobaccoReviewDto>') as List).map((item) => item as TobaccoReviewDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<PipeAccessoryStatisticsDto> tobaccoGetTobaccoSatistics(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Tobacco/{id}/GetStatistics".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
      return apiClient.deserialize(response.body, 'PipeAccessoryStatisticsDto') as PipeAccessoryStatisticsDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<SmokeSessionSimpleDto>> tobaccoGetTobaccoSessions(int id, { int pageSize, int page }) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Tobacco/{id}/GetSessions".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(pageSize != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    }
    if(page != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
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
      return (apiClient.deserialize(response.body, 'List<SmokeSessionSimpleDto>') as List).map((item) => item as SmokeSessionSimpleDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<TobaccoTasteDto>> tobaccoGetTobaccoTaste(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Tobacco/{id}/GetTaste".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
      return (apiClient.deserialize(response.body, 'List<TobaccoTasteDto>') as List).map((item) => item as TobaccoTasteDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<TobaccoDto>> tobaccoSearch(int page, int pageSize, { List<int> filterTastes, int filterSortBy, String filterBrand, bool filterOwned, bool filterSmoked, int filterSortDirection }) async {
    Object postBody;

    // verify required params are set
    if(page == null) {
     throw new ApiException(400, "Missing required param: page");
    }
    if(pageSize == null) {
     throw new ApiException(400, "Missing required param: pageSize");
    }

    // create path and map variables
    String path = "/api/Tobacco/search".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "page", page));
      queryParams.addAll(_convertParametersForCollectionFormat("", "pageSize", pageSize));
    if(filterTastes != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("multi", "filter.tastes", filterTastes));
    }
    if(filterSortBy != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "filter.sortBy", filterSortBy));
    }
    if(filterBrand != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "filter.brand", filterBrand));
    }
    if(filterOwned != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "filter.owned", filterOwned));
    }
    if(filterSmoked != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "filter.smoked", filterSmoked));
    }
    if(filterSortDirection != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "filter.sortDirection", filterSortDirection));
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
      return (apiClient.deserialize(response.body, 'List<TobaccoDto>') as List).map((item) => item as TobaccoDto).toList();
    } else {
      return null;
    }
  }
}
