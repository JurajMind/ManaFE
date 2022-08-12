# openapi.api.PingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pingDefaultAction**](PingApi.md#pingdefaultaction) | **GET** /api/Ping/{id} | 


# **pingDefaultAction**
> bool pingDefaultAction(id, version)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPingApi();
final String id = id_example; // String | 
final String version = version_example; // String | 

try {
    final response = api.pingDefaultAction(id, version);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PingApi->pingDefaultAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **version** | **String**|  | [optional] 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

