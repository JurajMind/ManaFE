# openapi.api.SmokeSessionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**smokeSessionEndSmokeSession**](SmokeSessionApi.md#smokesessionendsmokesession) | **POST** /api/SmokeSession/{id}/End | 
[**smokeSessionGetFinishedData**](SmokeSessionApi.md#smokesessiongetfinisheddata) | **GET** /api/SmokeSession/GetFinishedData | 
[**smokeSessionGetMetaData**](SmokeSessionApi.md#smokesessiongetmetadata) | **GET** /api/SmokeSession/GetMetaData | 
[**smokeSessionGetPufs**](SmokeSessionApi.md#smokesessiongetpufs) | **GET** /api/SmokeSession/GetPufs | 
[**smokeSessionGetSessionCode**](SmokeSessionApi.md#smokesessiongetsessioncode) | **GET** /api/SmokeSession/GetSessionCode | 
[**smokeSessionInitData**](SmokeSessionApi.md#smokesessioninitdata) | **GET** /api/SmokeSession/InitData | 
[**smokeSessionSaveMetaData**](SmokeSessionApi.md#smokesessionsavemetadata) | **POST** /api/SmokeSession/{id}/SaveMetaData | 
[**smokeSessionValidate**](SmokeSessionApi.md#smokesessionvalidate) | **GET** /api/SmokeSession/Validate | 


# **smokeSessionEndSmokeSession**
> SmokeSessionSimpleDto smokeSessionEndSmokeSession(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = id_example; // String | 

try { 
    final result = api_instance.smokeSessionEndSmokeSession(id);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionEndSmokeSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SmokeSessionSimpleDto**](SmokeSessionSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionGetFinishedData**
> FinishedSessionDataDto smokeSessionGetFinishedData(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = 56; // int | 

try { 
    final result = api_instance.smokeSessionGetFinishedData(id);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionGetFinishedData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**FinishedSessionDataDto**](FinishedSessionDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionGetMetaData**
> SmokeSessionMetaDataDto smokeSessionGetMetaData(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = id_example; // String | 

try { 
    final result = api_instance.smokeSessionGetMetaData(id);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionGetMetaData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SmokeSessionMetaDataDto**](SmokeSessionMetaDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionGetPufs**
> List<SmartHookahModelsDbPuf> smokeSessionGetPufs(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = 56; // int | 

try { 
    final result = api_instance.smokeSessionGetPufs(id);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionGetPufs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**List<SmartHookahModelsDbPuf>**](SmartHookahModelsDbPuf.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionGetSessionCode**
> Object smokeSessionGetSessionCode(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = id_example; // String | 

try { 
    final result = api_instance.smokeSessionGetSessionCode(id);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionGetSessionCode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionInitData**
> InitDataDto smokeSessionInitData(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = id_example; // String | 

try { 
    final result = api_instance.smokeSessionInitData(id);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionInitData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**InitDataDto**](InitDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionSaveMetaData**
> SmokeSessionMetaDataDto smokeSessionSaveMetaData(id, model)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = id_example; // String | 
final model = SmokeSessionMetaDataDto(); // SmokeSessionMetaDataDto | 

try { 
    final result = api_instance.smokeSessionSaveMetaData(id, model);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionSaveMetaData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **model** | [**SmokeSessionMetaDataDto**](SmokeSessionMetaDataDto.md)|  | 

### Return type

[**SmokeSessionMetaDataDto**](SmokeSessionMetaDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **smokeSessionValidate**
> Validation smokeSessionValidate(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = SmokeSessionApi();
final id = id_example; // String | 

try { 
    final result = api_instance.smokeSessionValidate(id);
    print(result);
} catch (e) {
    print('Exception when calling SmokeSessionApi->smokeSessionValidate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Validation**](Validation.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

