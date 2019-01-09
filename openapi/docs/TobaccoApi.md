# openapi.api.TobaccoApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tobaccoGetTobacco**](TobaccoApi.md#tobaccoGetTobacco) | **GET** /api/Tobacco/{id}/GetTobacco | 
[**tobaccoGetTobaccoInfo**](TobaccoApi.md#tobaccoGetTobaccoInfo) | **GET** /api/Tobacco/{id}/GetAllInfo | 
[**tobaccoGetTobaccoReviews**](TobaccoApi.md#tobaccoGetTobaccoReviews) | **GET** /api/Tobacco/{id}/GetReviews | 
[**tobaccoGetTobaccoSatistics**](TobaccoApi.md#tobaccoGetTobaccoSatistics) | **GET** /api/Tobacco/{id}/GetStatistics | 
[**tobaccoGetTobaccoSessions**](TobaccoApi.md#tobaccoGetTobaccoSessions) | **GET** /api/Tobacco/{id}/GetSessions | 
[**tobaccoGetTobaccoTaste**](TobaccoApi.md#tobaccoGetTobaccoTaste) | **GET** /api/Tobacco/{id}/GetTaste | 
[**tobaccoSearch**](TobaccoApi.md#tobaccoSearch) | **GET** /api/Tobacco/search | 


# **tobaccoGetTobacco**
> TobaccoSimpleDto tobaccoGetTobacco(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new TobaccoApi();
var id = 56; // int | 

try { 
    var result = api_instance.tobaccoGetTobacco(id);
    print(result);
} catch (e) {
    print("Exception when calling TobaccoApi->tobaccoGetTobacco: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**TobaccoSimpleDto**](TobaccoSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoInfo**
> TobaccoInformationDto tobaccoGetTobaccoInfo(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new TobaccoApi();
var id = 56; // int | 

try { 
    var result = api_instance.tobaccoGetTobaccoInfo(id);
    print(result);
} catch (e) {
    print("Exception when calling TobaccoApi->tobaccoGetTobaccoInfo: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**TobaccoInformationDto**](TobaccoInformationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoReviews**
> List<TobaccoReviewDto> tobaccoGetTobaccoReviews(id, pageSize, page)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new TobaccoApi();
var id = 56; // int | 
var pageSize = 56; // int | 
var page = 56; // int | 

try { 
    var result = api_instance.tobaccoGetTobaccoReviews(id, pageSize, page);
    print(result);
} catch (e) {
    print("Exception when calling TobaccoApi->tobaccoGetTobaccoReviews: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]

### Return type

[**List<TobaccoReviewDto>**](TobaccoReviewDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoSatistics**
> PipeAccessoryStatisticsDto tobaccoGetTobaccoSatistics(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new TobaccoApi();
var id = 56; // int | 

try { 
    var result = api_instance.tobaccoGetTobaccoSatistics(id);
    print(result);
} catch (e) {
    print("Exception when calling TobaccoApi->tobaccoGetTobaccoSatistics: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**PipeAccessoryStatisticsDto**](PipeAccessoryStatisticsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoSessions**
> List<SmokeSessionSimpleDto> tobaccoGetTobaccoSessions(id, pageSize, page)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new TobaccoApi();
var id = 56; // int | 
var pageSize = 56; // int | 
var page = 56; // int | 

try { 
    var result = api_instance.tobaccoGetTobaccoSessions(id, pageSize, page);
    print(result);
} catch (e) {
    print("Exception when calling TobaccoApi->tobaccoGetTobaccoSessions: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]

### Return type

[**List<SmokeSessionSimpleDto>**](SmokeSessionSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoTaste**
> List<TobaccoTasteDto> tobaccoGetTobaccoTaste(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new TobaccoApi();
var id = 56; // int | 

try { 
    var result = api_instance.tobaccoGetTobaccoTaste(id);
    print(result);
} catch (e) {
    print("Exception when calling TobaccoApi->tobaccoGetTobaccoTaste: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**List<TobaccoTasteDto>**](TobaccoTasteDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoSearch**
> List<TobaccoDto> tobaccoSearch(page, pageSize, filterTastes, filterSortBy, filterBrand, filterOwned, filterSmoked, filterSortDirection)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new TobaccoApi();
var page = 56; // int | 
var pageSize = 56; // int | 
var filterTastes = []; // List<int> | 
var filterSortBy = 56; // int | 
var filterBrand = filterBrand_example; // String | 
var filterOwned = true; // bool | 
var filterSmoked = true; // bool | 
var filterSortDirection = 56; // int | 

try { 
    var result = api_instance.tobaccoSearch(page, pageSize, filterTastes, filterSortBy, filterBrand, filterOwned, filterSmoked, filterSortDirection);
    print(result);
} catch (e) {
    print("Exception when calling TobaccoApi->tobaccoSearch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [default to null]
 **pageSize** | **int**|  | [default to null]
 **filterTastes** | [**List&lt;int&gt;**](int.md)|  | [optional] [default to []]
 **filterSortBy** | **int**|  | [optional] [default to null]
 **filterBrand** | **String**|  | [optional] [default to null]
 **filterOwned** | **bool**|  | [optional] [default to null]
 **filterSmoked** | **bool**|  | [optional] [default to null]
 **filterSortDirection** | **int**|  | [optional] [default to null]

### Return type

[**List<TobaccoDto>**](TobaccoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

