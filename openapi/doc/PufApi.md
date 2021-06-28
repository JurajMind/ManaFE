# openapi.api.PufApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pufDefaultAction**](PufApi.md#pufdefaultaction) | **POST** /api/Puf/{id} | 
[**pufLag**](PufApi.md#puflag) | **POST** /api/Puf/lag/{id} | 


# **pufDefaultAction**
> String pufDefaultAction(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PufApi();
final id = id_example; // String | 

try { 
    final result = api_instance.pufDefaultAction(id);
    print(result);
} catch (e) {
    print('Exception when calling PufApi->pufDefaultAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pufLag**
> String pufLag(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PufApi();
final id = id_example; // String | 

try { 
    final result = api_instance.pufLag(id);
    print(result);
} catch (e) {
    print('Exception when calling PufApi->pufLag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

