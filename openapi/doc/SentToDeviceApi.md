# openapi.api.SentToDeviceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**sentToDeviceDefaultAction**](SentToDeviceApi.md#senttodevicedefaultaction) | **POST** /api/SentToDevice/{id} | 


# **sentToDeviceDefaultAction**
> sentToDeviceDefaultAction(id, command, data)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSentToDeviceApi();
final String id = id_example; // String | 
final String command = command_example; // String | 
final String data = data_example; // String | 

try {
    api.sentToDeviceDefaultAction(id, command, data);
} catch on DioError (e) {
    print('Exception when calling SentToDeviceApi->sentToDeviceDefaultAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **command** | **String**|  | 
 **data** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

