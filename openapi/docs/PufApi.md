# openapi.api.PufApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pufDefaultAction**](PufApi.md#pufDefaultAction) | **POST** /api/Puf/{id} | 
[**pufLag**](PufApi.md#pufLag) | **POST** /api/Puf/lag/{id} | 


# **pufDefaultAction**
> String pufDefaultAction(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PufApi();
var id = id_example; // String | 

try { 
    var result = api_instance.pufDefaultAction(id);
    print(result);
} catch (e) {
    print("Exception when calling PufApi->pufDefaultAction: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pufLag**
> String pufLag(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PufApi();
var id = id_example; // String | 

try { 
    var result = api_instance.pufLag(id);
    print(result);
} catch (e) {
    print("Exception when calling PufApi->pufLag: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

