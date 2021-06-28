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

final api_instance = TobaccoApi();
final id = 56; // int | 

try { 
    final result = api_instance.tobaccoGetTobacco(id);
    print(result);
} catch (e) {
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

final api_instance = TobaccoApi();
final id = 56; // int | 
final pageSize = 56; // int | 
final page = 56; // int | 

try { 
    final result = api_instance.tobaccoGetTobaccoInMixes(id, pageSize, page);
    print(result);
} catch (e) {
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

[**List<TobaccoMixSimpleDto>**](TobaccoMixSimpleDto.md)

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

final api_instance = TobaccoApi();
final id = 56; // int | 

try { 
    final result = api_instance.tobaccoGetTobaccoInfo(id);
    print(result);
} catch (e) {
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

final api_instance = TobaccoApi();
final id = 56; // int | 

try { 
    final result = api_instance.tobaccoGetTobaccoSatistics(id);
    print(result);
} catch (e) {
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

final api_instance = TobaccoApi();
final id = 56; // int | 
final pageSize = 56; // int | 
final page = 56; // int | 

try { 
    final result = api_instance.tobaccoGetTobaccoSessions(id, pageSize, page);
    print(result);
} catch (e) {
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

[**List<SmokeSessionSimpleDto>**](SmokeSessionSimpleDto.md)

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

final api_instance = TobaccoApi();
final id = 56; // int | 

try { 
    final result = api_instance.tobaccoGetTobaccoTaste(id);
    print(result);
} catch (e) {
    print('Exception when calling TobaccoApi->tobaccoGetTobaccoTaste: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**List<TobaccoTasteDto>**](TobaccoTasteDto.md)

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

final api_instance = TobaccoApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final filterPeriodTastes = []; // List<int> | 
final filterPeriodSortBy = 56; // int | 
final filterPeriodBrand = filterPeriodBrand_example; // String | 
final filterPeriodOwned = true; // bool | 
final filterPeriodSmoked = true; // bool | 
final filterPeriodSortDirection = 56; // int | 

try { 
    final result = api_instance.tobaccoSearch(page, pageSize, filterPeriodTastes, filterPeriodSortBy, filterPeriodBrand, filterPeriodOwned, filterPeriodSmoked, filterPeriodSortDirection);
    print(result);
} catch (e) {
    print('Exception when calling TobaccoApi->tobaccoSearch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | 
 **pageSize** | **int**|  | 
 **filterPeriodTastes** | [**List<int>**](int.md)|  | [optional] [default to const []]
 **filterPeriodSortBy** | **int**|  | [optional] 
 **filterPeriodBrand** | **String**|  | [optional] 
 **filterPeriodOwned** | **bool**|  | [optional] 
 **filterPeriodSmoked** | **bool**|  | [optional] 
 **filterPeriodSortDirection** | **int**|  | [optional] 

### Return type

[**List<TobaccoDto>**](TobaccoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

