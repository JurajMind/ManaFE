# openapi.api.EndSessionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**endSessionDefaultAction**](EndSessionApi.md#endsessiondefaultaction) | **POST** /api/EndSession/{id} | 


# **endSessionDefaultAction**
> String endSessionDefaultAction(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = EndSessionApi();
final id = id_example; // String | 

try { 
    final result = api_instance.endSessionDefaultAction(id);
    print(result);
} catch (e) {
    print('Exception when calling EndSessionApi->endSessionDefaultAction: $e\n');
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

