# openapi.api.AnimApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**animDefaultAction**](AnimApi.md#animdefaultaction) | **POST** /api/Anim/{id} | 


# **animDefaultAction**
> String animDefaultAction(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAnimApi();
final String id = id_example; // String | 

try {
    final response = api.animDefaultAction(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AnimApi->animDefaultAction: $e\n');
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

