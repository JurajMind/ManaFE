# openapi.api.MediaApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**mediaAddGearPicture**](MediaApi.md#mediaaddgearpicture) | **POST** /api/Media/Gear/{id}/Add | 
[**mediaAddPlacePicture**](MediaApi.md#mediaaddplacepicture) | **POST** /api/Media/Place/{id}/Add | 
[**mediaAddPlaceReview**](MediaApi.md#mediaaddplacereview) | **POST** /api/Media/PlaceReview/{id}/Add | 
[**mediaAddSessionReview**](MediaApi.md#mediaaddsessionreview) | **POST** /api/Media/TobaccoReview/{id}/Add | 


# **mediaAddGearPicture**
> MediaDto mediaAddGearPicture(id, file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | A file

try {
    final response = api.mediaAddGearPicture(id, file);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MediaApi->mediaAddGearPicture: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **file** | **MultipartFile**| A file | 

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

final api = Openapi().getMediaApi();
final int id = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | A file

try {
    final response = api.mediaAddPlacePicture(id, file);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MediaApi->mediaAddPlacePicture: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **file** | **MultipartFile**| A file | 

### Return type

[**MediaDto**](MediaDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaAddPlaceReview**
> MediaDto mediaAddPlaceReview(id, file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | A file

try {
    final response = api.mediaAddPlaceReview(id, file);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MediaApi->mediaAddPlaceReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **file** | **MultipartFile**| A file | 

### Return type

[**MediaDto**](MediaDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaAddSessionReview**
> MediaDto mediaAddSessionReview(id, file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMediaApi();
final int id = 56; // int | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | A file

try {
    final response = api.mediaAddSessionReview(id, file);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MediaApi->mediaAddSessionReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **file** | **MultipartFile**| A file | 

### Return type

[**MediaDto**](MediaDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

