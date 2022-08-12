# openapi.api.ReviewApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reviewAddPlaceReview**](ReviewApi.md#reviewaddplacereview) | **POST** /api/Review/Place/{id} | 
[**reviewAddSessionReview**](ReviewApi.md#reviewaddsessionreview) | **POST** /api/Review/Session/{id} | 
[**reviewAddTobaccoReview**](ReviewApi.md#reviewaddtobaccoreview) | **POST** /api/Review/Tobacco/{id} | 
[**reviewGetPlaceReviews**](ReviewApi.md#reviewgetplacereviews) | **GET** /api/Review/Place/{id} | 
[**reviewGetSessionReview**](ReviewApi.md#reviewgetsessionreview) | **GET** /api/Review/Session/{id} | 
[**reviewGetTobaccoReview**](ReviewApi.md#reviewgettobaccoreview) | **GET** /api/Review/Tobacco/{id} | 
[**reviewRemovePlaceReview**](ReviewApi.md#reviewremoveplacereview) | **DELETE** /api/Review/Place/{id} | 
[**reviewRemoveSessionReview**](ReviewApi.md#reviewremovesessionreview) | **DELETE** /api/Review/Session/{id} | 
[**reviewRemoveTobaccoReview**](ReviewApi.md#reviewremovetobaccoreview) | **DELETE** /api/Review/Tobacco/{id} | 
[**reviewTobaccoReviewDetail**](ReviewApi.md#reviewtobaccoreviewdetail) | **GET** /api/Review/Tobacco/{id}/Detail | 


# **reviewAddPlaceReview**
> PlacesPlaceReviewDto reviewAddPlaceReview(id, reviewDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final String id = id_example; // String | 
final PlacesPlaceReviewDto reviewDto = ; // PlacesPlaceReviewDto | 

try {
    final response = api.reviewAddPlaceReview(id, reviewDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewAddPlaceReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **reviewDto** | [**PlacesPlaceReviewDto**](PlacesPlaceReviewDto.md)|  | 

### Return type

[**PlacesPlaceReviewDto**](PlacesPlaceReviewDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewAddSessionReview**
> SmartHookahModelsDbSessionDtoSessionReviewDto reviewAddSessionReview(id, reviewDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 
final SmartHookahModelsDbSessionDtoSessionReviewDto reviewDto = ; // SmartHookahModelsDbSessionDtoSessionReviewDto | 

try {
    final response = api.reviewAddSessionReview(id, reviewDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewAddSessionReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **reviewDto** | [**SmartHookahModelsDbSessionDtoSessionReviewDto**](SmartHookahModelsDbSessionDtoSessionReviewDto.md)|  | 

### Return type

[**SmartHookahModelsDbSessionDtoSessionReviewDto**](SmartHookahModelsDbSessionDtoSessionReviewDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewAddTobaccoReview**
> GearTobaccoReviewDto reviewAddTobaccoReview(id, reviewDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final String id = id_example; // String | 
final GearTobaccoReviewDto reviewDto = ; // GearTobaccoReviewDto | 

try {
    final response = api.reviewAddTobaccoReview(id, reviewDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewAddTobaccoReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **reviewDto** | [**GearTobaccoReviewDto**](GearTobaccoReviewDto.md)|  | 

### Return type

[**GearTobaccoReviewDto**](GearTobaccoReviewDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewGetPlaceReviews**
> List<PlacesPlaceReviewDto> reviewGetPlaceReviews(id, pageSize, page)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 
final int pageSize = 56; // int | 
final int page = 56; // int | 

try {
    final response = api.reviewGetPlaceReviews(id, pageSize, page);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewGetPlaceReviews: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 

### Return type

[**List&lt;PlacesPlaceReviewDto&gt;**](PlacesPlaceReviewDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewGetSessionReview**
> List<SmartHookahModelsDbSessionDtoSessionReviewDto> reviewGetSessionReview(id, pageSize, page)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 
final int pageSize = 56; // int | 
final int page = 56; // int | 

try {
    final response = api.reviewGetSessionReview(id, pageSize, page);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewGetSessionReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 

### Return type

[**List&lt;SmartHookahModelsDbSessionDtoSessionReviewDto&gt;**](SmartHookahModelsDbSessionDtoSessionReviewDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewGetTobaccoReview**
> List<GearTobaccoReviewDto> reviewGetTobaccoReview(id, pageSize, page)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 
final int pageSize = 56; // int | 
final int page = 56; // int | 

try {
    final response = api.reviewGetTobaccoReview(id, pageSize, page);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewGetTobaccoReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 

### Return type

[**List&lt;GearTobaccoReviewDto&gt;**](GearTobaccoReviewDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewRemovePlaceReview**
> bool reviewRemovePlaceReview(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 

try {
    final response = api.reviewRemovePlaceReview(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewRemovePlaceReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewRemoveSessionReview**
> bool reviewRemoveSessionReview(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 

try {
    final response = api.reviewRemoveSessionReview(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewRemoveSessionReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewRemoveTobaccoReview**
> bool reviewRemoveTobaccoReview(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 

try {
    final response = api.reviewRemoveTobaccoReview(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewRemoveTobaccoReview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reviewTobaccoReviewDetail**
> GearTobaccoReviewDetailDto reviewTobaccoReviewDetail(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReviewApi();
final int id = 56; // int | 

try {
    final response = api.reviewTobaccoReviewDetail(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReviewApi->reviewTobaccoReviewDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**GearTobaccoReviewDetailDto**](GearTobaccoReviewDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

