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

final api = Openapi().getQRCodeApi();
final String id = id_example; // String | 

try {
    final response = api.qRCodeDefaultAction(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling QRCodeApi->qRCodeDefaultAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

