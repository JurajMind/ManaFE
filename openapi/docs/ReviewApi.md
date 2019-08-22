# openapi.api.ReviewApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reviewAddPlaceReview**](ReviewApi.md#reviewAddPlaceReview) | **POST** /api/Review/Place/{id} | 
[**reviewAddSessionReview**](ReviewApi.md#reviewAddSessionReview) | **POST** /api/Review/Session/{id} | 
[**reviewAddTobaccoReview**](ReviewApi.md#reviewAddTobaccoReview) | **POST** /api/Review/Tobacco/{id} | 
[**reviewGetPlaceReviews**](ReviewApi.md#reviewGetPlaceReviews) | **GET** /api/Review/Place/{id} | 
[**reviewGetSessionReview**](ReviewApi.md#reviewGetSessionReview) | **GET** /api/Review/Session/{id} | 
[**reviewGetTobaccoReview**](ReviewApi.md#reviewGetTobaccoReview) | **GET** /api/Review/Tobacco/{id} | 
[**reviewRemovePlaceReview**](ReviewApi.md#reviewRemovePlaceReview) | **DELETE** /api/Review/Place/{id} | 
[**reviewRemoveSessionReview**](ReviewApi.md#reviewRemoveSessionReview) | **DELETE** /api/Review/Session/{id} | 
[**reviewRemoveTobaccoReview**](ReviewApi.md#reviewRemoveTobaccoReview) | **DELETE** /api/Review/Tobacco/{id} | 
[**reviewTobaccoReviewDetail**](ReviewApi.md#reviewTobaccoReviewDetail) | **DELETE** /api/Review/Tobacco/{id}/Detail | 


# **reviewAddPlaceReview**
> PlacesPlaceReviewDto reviewAddPlaceReview(id, reviewDto)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReviewApi();
var id = id_example; // String | 
var reviewDto = new PlacesPlaceReviewDto(); // PlacesPlaceReviewDto | 

try { 
    var result = api_instance.reviewAddPlaceReview(id, reviewDto);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewAddPlaceReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
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

var api_instance = new ReviewApi();
var id = id_example; // String | 
var reviewDto = new SmartHookahModelsDbSessionDtoSessionReviewDto(); // SmartHookahModelsDbSessionDtoSessionReviewDto | 

try { 
    var result = api_instance.reviewAddSessionReview(id, reviewDto);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewAddSessionReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
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

var api_instance = new ReviewApi();
var id = id_example; // String | 
var reviewDto = new GearTobaccoReviewDto(); // GearTobaccoReviewDto | 

try { 
    var result = api_instance.reviewAddTobaccoReview(id, reviewDto);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewAddTobaccoReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
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

var api_instance = new ReviewApi();
var id = 56; // int | 
var pageSize = 56; // int | 
var page = 56; // int | 

try { 
    var result = api_instance.reviewGetPlaceReviews(id, pageSize, page);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewGetPlaceReviews: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]

### Return type

[**List<PlacesPlaceReviewDto>**](PlacesPlaceReviewDto.md)

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

var api_instance = new ReviewApi();
var id = 56; // int | 
var pageSize = 56; // int | 
var page = 56; // int | 

try { 
    var result = api_instance.reviewGetSessionReview(id, pageSize, page);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewGetSessionReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]

### Return type

[**List<SmartHookahModelsDbSessionDtoSessionReviewDto>**](SmartHookahModelsDbSessionDtoSessionReviewDto.md)

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

var api_instance = new ReviewApi();
var id = 56; // int | 
var pageSize = 56; // int | 
var page = 56; // int | 

try { 
    var result = api_instance.reviewGetTobaccoReview(id, pageSize, page);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewGetTobaccoReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]

### Return type

[**List<GearTobaccoReviewDto>**](GearTobaccoReviewDto.md)

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

var api_instance = new ReviewApi();
var id = 56; // int | 

try { 
    var result = api_instance.reviewRemovePlaceReview(id);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewRemovePlaceReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

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

var api_instance = new ReviewApi();
var id = 56; // int | 

try { 
    var result = api_instance.reviewRemoveSessionReview(id);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewRemoveSessionReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

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

var api_instance = new ReviewApi();
var id = 56; // int | 

try { 
    var result = api_instance.reviewRemoveTobaccoReview(id);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewRemoveTobaccoReview: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

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

var api_instance = new ReviewApi();
var id = 56; // int | 

try { 
    var result = api_instance.reviewTobaccoReviewDetail(id);
    print(result);
} catch (e) {
    print("Exception when calling ReviewApi->reviewTobaccoReviewDetail: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**GearTobaccoReviewDetailDto**](GearTobaccoReviewDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

