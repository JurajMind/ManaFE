# openapi.api.StandPictureApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**standPictureDefaultAction**](StandPictureApi.md#standPictureDefaultAction) | **GET** /api/StandPicture/{id} | 


# **standPictureDefaultAction**
> Object standPictureDefaultAction(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new StandPictureApi();
var id = id_example; // String | 

try { 
    var result = api_instance.standPictureDefaultAction(id);
    print(result);
} catch (e) {
    print("Exception when calling StandPictureApi->standPictureDefaultAction: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

