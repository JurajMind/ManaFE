# openapi.api.TobaccoApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tobaccoGetTobacco**](TobaccoApi.md#tobaccogettobacco) | **GET** /api/Tobacco/{id}/GetTobacco | 
[**tobaccoGetTobaccoInMixes**](TobaccoApi.md#tobaccogettobaccoinmixes) | **GET** /api/Tobacco/{id}/InMix | 
[**tobaccoGetTobaccoInfo**](TobaccoApi.md#tobaccogettobaccoinfo) | **GET** /api/Tobacco/{id}/GetAllInfo | 
[**tobaccoGetTobaccoSatistics**](TobaccoApi.md#tobaccogettobaccosatistics) | **GET** /api/Tobacco/{id}/GetStatistics | 
[**tobaccoGetTobaccoSessions**](TobaccoApi.md#tobaccogettobaccosessions) | **GET** /api/Tobacco/{id}/GetSessions | 
[**tobaccoGetTobaccoTaste**](TobaccoApi.md#tobaccogettobaccotaste) | **GET** /api/Tobacco/{id}/GetTaste | 
[**tobaccoSearch**](TobaccoApi.md#tobaccosearch) | **GET** /api/Tobacco/search | 


# **tobaccoGetTobacco**
> TobaccoSimpleDto tobaccoGetTobacco(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTobaccoApi();
final int id = 56; // int | 

try {
    final response = api.tobaccoGetTobacco(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TobaccoApi->tobaccoGetTobacco: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**TobaccoSimpleDto**](TobaccoSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoInMixes**
> List<TobaccoMixSimpleDto> tobaccoGetTobaccoInMixes(id, pageSize, page)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTobaccoApi();
final int id = 56; // int | 
final int pageSize = 56; // int | 
final int page = 56; // int | 

try {
    final response = api.tobaccoGetTobaccoInMixes(id, pageSize, page);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TobaccoApi->tobaccoGetTobaccoInMixes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 

### Return type

[**List&lt;TobaccoMixSimpleDto&gt;**](TobaccoMixSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoInfo**
> TobaccoInformationDto tobaccoGetTobaccoInfo(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTobaccoApi();
final int id = 56; // int | 

try {
    final response = api.tobaccoGetTobaccoInfo(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TobaccoApi->tobaccoGetTobaccoInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**TobaccoInformationDto**](TobaccoInformationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoSatistics**
> PipeAccessoryStatisticsDto tobaccoGetTobaccoSatistics(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTobaccoApi();
final int id = 56; // int | 

try {
    final response = api.tobaccoGetTobaccoSatistics(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TobaccoApi->tobaccoGetTobaccoSatistics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PipeAccessoryStatisticsDto**](PipeAccessoryStatisticsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoSessions**
> List<SmokeSessionSimpleDto> tobaccoGetTobaccoSessions(id, pageSize, page)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTobaccoApi();
final int id = 56; // int | 
final int pageSize = 56; // int | 
final int page = 56; // int | 

try {
    final response = api.tobaccoGetTobaccoSessions(id, pageSize, page);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TobaccoApi->tobaccoGetTobaccoSessions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 

### Return type

[**List&lt;SmokeSessionSimpleDto&gt;**](SmokeSessionSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoGetTobaccoTaste**
> List<TobaccoTasteDto> tobaccoGetTobaccoTaste(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTobaccoApi();
final int id = 56; // int | 

try {
    final response = api.tobaccoGetTobaccoTaste(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TobaccoApi->tobaccoGetTobaccoTaste: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**List&lt;TobaccoTasteDto&gt;**](TobaccoTasteDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tobaccoSearch**
> List<TobaccoDto> tobaccoSearch(page, pageSize, filterPeriodTastes, filterPeriodSortBy, filterPeriodBrand, filterPeriodOwned, filterPeriodSmoked, filterPeriodSortDirection)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTobaccoApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final List<int> filterPeriodTastes = ; // List<int> | 
final int filterPeriodSortBy = 56; // int | 
final String filterPeriodBrand = filterPeriodBrand_example; // String | 
final bool filterPeriodOwned = true; // bool | 
final bool filterPeriodSmoked = true; // bool | 
final int filterPeriodSortDirection = 56; // int | 

try {
    final response = api.tobaccoSearch(page, pageSize, filterPeriodTastes, filterPeriodSortBy, filterPeriodBrand, filterPeriodOwned, filterPeriodSmoked, filterPeriodSortDirection);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TobaccoApi->tobaccoSearch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | 
 **pageSize** | **int**|  | 
 **filterPeriodTastes** | [**List&lt;int&gt;**](int.md)|  | [optional] 
 **filterPeriodSortBy** | **int**|  | [optional] 
 **filterPeriodBrand** | **String**|  | [optional] 
 **filterPeriodOwned** | **bool**|  | [optional] 
 **filterPeriodSmoked** | **bool**|  | [optional] 
 **filterPeriodSortDirection** | **int**|  | [optional] 

### Return type

[**List&lt;TobaccoDto&gt;**](TobaccoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

