# openapi.api.AnimationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**animationGetAnimations**](AnimationApi.md#animationgetanimations) | **GET** /api/Animations/GetAnimations | 


# **animationGetAnimations**
> Animations animationGetAnimations(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAnimationApi();
final String id = id_example; // String | 

try {
    final response = api.animationGetAnimations(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AnimationApi->animationGetAnimations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Animations**](Animations.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

