# openapi.api.QRCodeApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**qRCodeDefaultAction**](QRCodeApi.md#qrcodedefaultaction) | **GET** /api/QRCode/{id} | 


# **qRCodeDefaultAction**
> Object qRCodeDefaultAction(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = QRCodeApi();
final id = id_example; // String | 

try { 
    final result = api_instance.qRCodeDefaultAction(id);
    print(result);
} catch (e) {
    print('Exception when calling QRCodeApi->qRCodeDefaultAction: $e\n');
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

