# openapi.api.SmokeSessionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**smokeSessionGetFinishedData**](SmokeSessionApi.md#smokeSessionGetFinishedData) | **GET** /api/SmokeSession/GetFinishedData | 
[**smokeSessionGetMetaData**](SmokeSessionApi.md#smokeSessionGetMetaData) | **GET** /api/SmokeSession/GetMetaData | 
[**smokeSessionGetPufs**](SmokeSessionApi.md#smokeSessionGetPufs) | **GET** /api/SmokeSession/GetPufs | 
[**smokeSessionGetSessionCode**](SmokeSessionApi.md#smokeSessionGetSessionCode) | **GET** /api/SmokeSession/GetSessionCode | 
[**smokeSessionInitData**](SmokeSessionApi.md#smokeSessionInitData) | **GET** /api/SmokeSession/InitData | 
[**smokeSessionSaveMetaData**](SmokeSessionApi.md#smokeSessionSaveMetaData) | **POST** /api/SmokeSession/{id}/SaveMetaData | 
[**smokeSessionValidate**](SmokeSessionApi.md#smokeSessionValidate) | **GET** /api/SmokeSession/Validate | 


# **smokeSessionGetFinishedData**
> FinishedSessionDataDto smokeSessionGetFinishedData(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SmokeSessionApi();
var id = 56; // int | 

try { 
    var result = api_instance.smokeSessionGetFinishedData(id);
    print(result);
} catch (e) {
    print("Exception when calling SmokeSessionApi->smokeSessionGetFinishedData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**FinishedSessionDataDto**](FinishedSessionDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionGetMetaData**
> SmokeSessionMetaDataDto smokeSessionGetMetaData(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SmokeSessionApi();
var id = id_example; // String | 

try { 
    var result = api_instance.smokeSessionGetMetaData(id);
    print(result);
} catch (e) {
    print("Exception when calling SmokeSessionApi->smokeSessionGetMetaData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**SmokeSessionMetaDataDto**](SmokeSessionMetaDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionGetPufs**
> List<SmartHookahModelsDbPuf> smokeSessionGetPufs(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SmokeSessionApi();
var id = 56; // int | 

try { 
    var result = api_instance.smokeSessionGetPufs(id);
    print(result);
} catch (e) {
    print("Exception when calling SmokeSessionApi->smokeSessionGetPufs: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**List<SmartHookahModelsDbPuf>**](SmartHookahModelsDbPuf.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionGetSessionCode**
> Object smokeSessionGetSessionCode(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SmokeSessionApi();
var id = id_example; // String | 

try { 
    var result = api_instance.smokeSessionGetSessionCode(id);
    print(result);
} catch (e) {
    print("Exception when calling SmokeSessionApi->smokeSessionGetSessionCode: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionInitData**
> InitDataDto smokeSessionInitData(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SmokeSessionApi();
var id = id_example; // String | 

try { 
    var result = api_instance.smokeSessionInitData(id);
    print(result);
} catch (e) {
    print("Exception when calling SmokeSessionApi->smokeSessionInitData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**InitDataDto**](InitDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionSaveMetaData**
> SmokeSessionMetaDataDto smokeSessionSaveMetaData(id, smokeSessionMetaDataDto)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SmokeSessionApi();
var id = id_example; // String | 
var smokeSessionMetaDataDto = new SmokeSessionMetaDataDto(); // SmokeSessionMetaDataDto | 

try { 
    var result = api_instance.smokeSessionSaveMetaData(id, smokeSessionMetaDataDto);
    print(result);
} catch (e) {
    print("Exception when calling SmokeSessionApi->smokeSessionSaveMetaData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **smokeSessionMetaDataDto** | [**SmokeSessionMetaDataDto**](SmokeSessionMetaDataDto.md)|  | 

### Return type

[**SmokeSessionMetaDataDto**](SmokeSessionMetaDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionValidate**
> Validation smokeSessionValidate(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SmokeSessionApi();
var id = id_example; // String | 

try { 
    var result = api_instance.smokeSessionValidate(id);
    print(result);
} catch (e) {
    print("Exception when calling SmokeSessionApi->smokeSessionValidate: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**Validation**](Validation.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

