# openapi.api.MediaApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**mediaAddGearPicture**](MediaApi.md#mediaAddGearPicture) | **POST** /api/Media/Gear/{id}/Add | 
[**mediaAddPlacePicture**](MediaApi.md#mediaAddPlacePicture) | **POST** /api/Media/Place/{id}/Add | 
[**mediaAddReviewPicture**](MediaApi.md#mediaAddReviewPicture) | **POST** /api/Media/Review/{id}/Add | 


# **mediaAddGearPicture**
> MediaDto mediaAddGearPicture(id, file)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new MediaApi();
var id = 56; // int | 
var file = BINARY_DATA_HERE; // MultipartFile | A file

try { 
    var result = api_instance.mediaAddGearPicture(id, file);
    print(result);
} catch (e) {
    print("Exception when calling MediaApi->mediaAddGearPicture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **file** | **MultipartFile**| A file | [default to null]

### Return type

[**MediaDto**](MediaDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaAddPlacePicture**
> MediaDto mediaAddPlacePicture(id, file)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new MediaApi();
var id = 56; // int | 
var file = BINARY_DATA_HERE; // MultipartFile | A file

try { 
    var result = api_instance.mediaAddPlacePicture(id, file);
    print(result);
} catch (e) {
    print("Exception when calling MediaApi->mediaAddPlacePicture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **file** | **MultipartFile**| A file | [default to null]

### Return type

[**MediaDto**](MediaDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaAddReviewPicture**
> MediaDto mediaAddReviewPicture(id, file)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new MediaApi();
var id = 56; // int | 
var file = BINARY_DATA_HERE; // MultipartFile | A file

try { 
    var result = api_instance.mediaAddReviewPicture(id, file);
    print(result);
} catch (e) {
    print("Exception when calling MediaApi->mediaAddReviewPicture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **file** | **MultipartFile**| A file | [default to null]

### Return type

[**MediaDto**](MediaDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

