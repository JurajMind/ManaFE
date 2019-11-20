part of openapi.api;



class DevicePresetApi {
  final ApiClient apiClient;

  DevicePresetApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<Object> devicePresetDeletePreset(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Device/Preset/{id}/Delete".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
      return apiClient.deserialize(_decodeBodyBytes(response), 'Object') as Object;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<DevicePresetDto> devicePresetGetPreset(int id) async {
    Object postBody;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Device/Preset/{id}/GetPreset".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
      return apiClient.deserialize(_decodeBodyBytes(response), 'DevicePresetDto') as DevicePresetDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<DevicePresetDto>> devicePresetGetUserPresets() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/Device/Preset/GetUserPresets".replaceAll("{format}","json");

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
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<DevicePresetDto>') as List).map((item) => item as DevicePresetDto).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<DevicePresetDto> devicePresetSaveDevicePreset(String deviceId, String name, { bool addToPerson, bool setDefault }) async {
    Object postBody;

    // verify required params are set
    if(deviceId == null) {
     throw new ApiException(400, "Missing required param: deviceId");
    }
    if(name == null) {
     throw new ApiException(400, "Missing required param: name");
    }

    // create path and map variables
    String path = "/api/Device/Preset/SavePresetFromDevice/{deviceId}".replaceAll("{format}","json").replaceAll("{" + "deviceId" + "}", deviceId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "name", name));
    if(addToPerson != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "addToPerson", addToPerson));
    }
    if(setDefault != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "setDefault", setDefault));
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
      return apiClient.deserialize(_decodeBodyBytes(response), 'DevicePresetDto') as DevicePresetDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<DevicePresetDto> devicePresetSaveSessionPreset(String sessionCode, String name, { bool addToPerson, bool setDefault }) async {
    Object postBody;

    // verify required params are set
    if(sessionCode == null) {
     throw new ApiException(400, "Missing required param: sessionCode");
    }
    if(name == null) {
     throw new ApiException(400, "Missing required param: name");
    }

    // create path and map variables
    String path = "/api/Device/Preset/{sessionCode}/SavePresetFromSession".replaceAll("{format}","json").replaceAll("{" + "sessionCode" + "}", sessionCode.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "name", name));
    if(addToPerson != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "addToPerson", addToPerson));
    }
    if(setDefault != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "setDefault", setDefault));
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
      return apiClient.deserialize(_decodeBodyBytes(response), 'DevicePresetDto') as DevicePresetDto;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future devicePresetSetDefault(int presetId) async {
    Object postBody;

    // verify required params are set
    if(presetId == null) {
     throw new ApiException(400, "Missing required param: presetId");
    }

    // create path and map variables
    String path = "/api/Device/Preset/{presetId}/SetDefault".replaceAll("{format}","json").replaceAll("{" + "presetId" + "}", presetId.toString());

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
    } else {
      return;
    }
  }
  /// 
  ///
  /// 
  Future devicePresetUseDefault(String sessionId) async {
    Object postBody;

    // verify required params are set
    if(sessionId == null) {
     throw new ApiException(400, "Missing required param: sessionId");
    }

    // create path and map variables
    String path = "/api/Device/Preset/UseDefault/{sessionId}".replaceAll("{format}","json").replaceAll("{" + "sessionId" + "}", sessionId.toString());

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
    } else {
      return;
    }
  }
  /// 
  ///
  /// 
  Future devicePresetUsePreset(String sessionId, int presetId) async {
    Object postBody;

    // verify required params are set
    if(sessionId == null) {
     throw new ApiException(400, "Missing required param: sessionId");
    }
    if(presetId == null) {
     throw new ApiException(400, "Missing required param: presetId");
    }

    // create path and map variables
    String path = "/api/Device/Preset/{presetId}/Use/{sessionId}".replaceAll("{format}","json").replaceAll("{" + "sessionId" + "}", sessionId.toString()).replaceAll("{" + "presetId" + "}", presetId.toString());

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
    } else {
      return;
    }
  }
}
