# openapi.api.PingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pingDefaultAction**](PingApi.md#pingDefaultAction) | **GET** /api/Ping/{id} | 


# **pingDefaultAction**
> bool pingDefaultAction(id, version)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PingApi();
var id = id_example; // String | 
var version = version_example; // String | 

try { 
    var result = api_instance.pingDefaultAction(id, version);
    print(result);
} catch (e) {
    print("Exception when calling PingApi->pingDefaultAction: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **version** | **String**|  | [optional] [default to null]

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

