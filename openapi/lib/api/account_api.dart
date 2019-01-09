part of openapi.api;



class AccountApi {
  final ApiClient apiClient;

  AccountApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<Object> accountForgotPassword(SmartHookahModelsForgotPasswordViewModel smartHookahModelsForgotPasswordViewModel) async {
    Object postBody = smartHookahModelsForgotPasswordViewModel;

    // verify required params are set
    if(smartHookahModelsForgotPasswordViewModel == null) {
     throw new ApiException(400, "Missing required param: smartHookahModelsForgotPasswordViewModel");
    }

    // create path and map variables
    String path = "/api/Account/ForgotPassword".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json","text/json","application/xml","text/xml","application/x-www-form-urlencoded"];

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
      return apiClient.deserialize(response.body, 'Object') as Object;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Object> accountRegister(UserModel userModel) async {
    Object postBody = userModel;

    // verify required params are set
    if(userModel == null) {
     throw new ApiException(400, "Missing required param: userModel");
    }

    // create path and map variables
    String path = "/api/Account/Register".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json","text/json","application/xml","text/xml","application/x-www-form-urlencoded"];

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
      return apiClient.deserialize(response.body, 'Object') as Object;
    } else {
      return null;
    }
  }
}
