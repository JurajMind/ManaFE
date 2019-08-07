part of openapi.api;



class PlaceCalendarApi {
  final ApiClient apiClient;

  PlaceCalendarApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<Dto> placeCalendarCreatePlaceEventFromFacebook(String url) async {
    Object postBody;

    // verify required params are set
    if(url == null) {
     throw new ApiException(400, "Missing required param: url");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/CreateEventFromFacebook".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "url", url));

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
      return apiClient.deserialize(_decodeBodyBytes(response), 'Dto') as Dto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Dto> placeCalendarDeletePlaceDay(int dayId) async {
    Object postBody;

    // verify required params are set
    if(dayId == null) {
     throw new ApiException(400, "Missing required param: dayId");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/DeletePlaceDay".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "dayId", dayId));

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
  Future<Dto> placeCalendarDeletePlaceEvent(int eventId) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/DeletePlaceEvent".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "eventId", eventId));

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
  Future<PlaceEventCollection> placeCalendarFindEventsBy(int placeId, DateTime startsAfter, DateTime endsBefore, { String privacyType }) async {
    Object postBody;

    // verify required params are set
    if(placeId == null) {
     throw new ApiException(400, "Missing required param: placeId");
    }
    if(startsAfter == null) {
     throw new ApiException(400, "Missing required param: startsAfter");
    }
    if(endsBefore == null) {
     throw new ApiException(400, "Missing required param: endsBefore");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/FindEventsBy".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "placeId", placeId));
      queryParams.addAll(_convertParametersForCollectionFormat("", "startsAfter", startsAfter));
      queryParams.addAll(_convertParametersForCollectionFormat("", "endsBefore", endsBefore));
    if(privacyType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "privacyType", privacyType));
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
      return apiClient.deserialize(_decodeBodyBytes(response), 'PlaceEventCollection') as PlaceEventCollection;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<PlaceCalendarDto> placeCalendarGetPlaceCalendar(int placeId, { String privacyType }) async {
    Object postBody;

    // verify required params are set
    if(placeId == null) {
     throw new ApiException(400, "Missing required param: placeId");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/GetCalendar".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "placeId", placeId));
    if(privacyType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "privacyType", privacyType));
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
      return apiClient.deserialize(_decodeBodyBytes(response), 'PlaceCalendarDto') as PlaceCalendarDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<PlaceDay> placeCalendarGetPlaceDay(int placeId, int dayId, DateTime dayDate, { String privacyType }) async {
    Object postBody;

    // verify required params are set
    if(placeId == null) {
     throw new ApiException(400, "Missing required param: placeId");
    }
    if(dayId == null) {
     throw new ApiException(400, "Missing required param: dayId");
    }
    if(dayDate == null) {
     throw new ApiException(400, "Missing required param: dayDate");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/GetPlaceDay".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "placeId", placeId));
      queryParams.addAll(_convertParametersForCollectionFormat("", "dayId", dayId));
      queryParams.addAll(_convertParametersForCollectionFormat("", "dayDate", dayDate));
    if(privacyType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "privacyType", privacyType));
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
      return apiClient.deserialize(_decodeBodyBytes(response), 'PlaceDay') as PlaceDay;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<PlaceEvent> placeCalendarGetPlaceEvent(int eventId) async {
    Object postBody;

    // verify required params are set
    if(eventId == null) {
     throw new ApiException(400, "Missing required param: eventId");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/GetPlaceEvent".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "eventId", eventId));

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
      return apiClient.deserialize(_decodeBodyBytes(response), 'PlaceEvent') as PlaceEvent;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Dto> placeCalendarSavePlaceDay(PlaceDay placeDay) async {
    Object postBody = placeDay;

    // verify required params are set
    if(placeDay == null) {
     throw new ApiException(400, "Missing required param: placeDay");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/SavePlaceDay".replaceAll("{format}","json");

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
      return apiClient.deserialize(_decodeBodyBytes(response), 'Dto') as Dto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Dto> placeCalendarSavePlaceEvent(PlaceEvent placeEvent) async {
    Object postBody = placeEvent;

    // verify required params are set
    if(placeEvent == null) {
     throw new ApiException(400, "Missing required param: placeEvent");
    }

    // create path and map variables
    String path = "/api/PlaceCalendar/SavePlaceEvent".replaceAll("{format}","json");

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
      return apiClient.deserialize(_decodeBodyBytes(response), 'Dto') as Dto;
    } else {
      return null;
    }
  }
}
