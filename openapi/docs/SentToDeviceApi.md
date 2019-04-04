# openapi.api.SentToDeviceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**sentToDeviceDefaultAction**](SentToDeviceApi.md#sentToDeviceDefaultAction) | **POST** /api/SentToDevice/{id} | 


# **sentToDeviceDefaultAction**
> sentToDeviceDefaultAction(id, command, data)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new SentToDeviceApi();
var id = id_example; // String | 
var command = command_example; // String | 
var data = data_example; // String | 

try { 
    api_instance.sentToDeviceDefaultAction(id, command, data);
} catch (e) {
    print("Exception when calling SentToDeviceApi->sentToDeviceDefaultAction: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **command** | **String**|  | [default to null]
 **data** | **String**|  | [optional] [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

