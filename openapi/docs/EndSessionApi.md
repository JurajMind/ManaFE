# openapi.api.EndSessionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**endSessionDefaultAction**](EndSessionApi.md#endSessionDefaultAction) | **POST** /api/EndSession/{id} | 


# **endSessionDefaultAction**
> String endSessionDefaultAction(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new EndSessionApi();
var id = id_example; // String | 

try { 
    var result = api_instance.endSessionDefaultAction(id);
    print(result);
} catch (e) {
    print("Exception when calling EndSessionApi->endSessionDefaultAction: $e\n");
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

