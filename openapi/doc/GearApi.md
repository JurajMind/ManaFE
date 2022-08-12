# openapi.api.GearApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**gearAddGear**](GearApi.md#gearaddgear) | **POST** /api/Gear/Add | 
[**gearGetBrand**](GearApi.md#geargetbrand) | **GET** /api/Gear/Brand/{brandName} | 
[**gearGetBrands**](GearApi.md#geargetbrands) | **GET** /api/Gear/Brands | 
[**gearGetBrandsPrefix**](GearApi.md#geargetbrandsprefix) | **GET** /api/Gear/Brands/{prefix} | 
[**gearGetDetails**](GearApi.md#geargetdetails) | **GET** /api/Gear/{id}/Detail | 
[**gearInfo**](GearApi.md#gearinfo) | **GET** /api/Gear/{id}/Info | 
[**gearMerge**](GearApi.md#gearmerge) | **POST** /api/Gear/Merge | 
[**gearSearch**](GearApi.md#gearsearch) | **GET** /api/Gear/Search/{search} | 
[**gearSessions**](GearApi.md#gearsessions) | **GET** /api/Gear/{id}/Sessions | 
[**gearVote**](GearApi.md#gearvote) | **POST** /api/Gear/{id}/Vote | 


# **gearAddGear**
> PipeAccesorySimpleDto gearAddGear(accessory)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final PipeAccesorySimpleDto accessory = ; // PipeAccesorySimpleDto | 

try {
    final response = api.gearAddGear(accessory);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearAddGear: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accessory** | [**PipeAccesorySimpleDto**](PipeAccesorySimpleDto.md)|  | 

### Return type

[**PipeAccesorySimpleDto**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearGetBrand**
> BrandDto gearGetBrand(brandName)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final String brandName = brandName_example; // String | 

try {
    final response = api.gearGetBrand(brandName);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearGetBrand: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **brandName** | **String**|  | 

### Return type

[**BrandDto**](BrandDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearGetBrands**
> GearGetBrands200Response gearGetBrands()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();

try {
    final response = api.gearGetBrands();
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearGetBrands: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GearGetBrands200Response**](GearGetBrands200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearGetBrandsPrefix**
> List<String> gearGetBrandsPrefix(prefix)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final String prefix = prefix_example; // String | 

try {
    final response = api.gearGetBrandsPrefix(prefix);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearGetBrandsPrefix: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **String**|  | 

### Return type

**List&lt;String&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearGetDetails**
> PipeAccessoryDetailsDto gearGetDetails(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final int id = 56; // int | 

try {
    final response = api.gearGetDetails(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearGetDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PipeAccessoryDetailsDto**](PipeAccessoryDetailsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearInfo**
> PipeAccesorySimpleDto gearInfo(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final int id = 56; // int | 

try {
    final response = api.gearInfo(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PipeAccesorySimpleDto**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearMerge**
> PipeAccesorySimpleDto gearMerge(targetId, sourceId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final int targetId = 56; // int | 
final int sourceId = 56; // int | 

try {
    final response = api.gearMerge(targetId, sourceId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearMerge: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **targetId** | **int**|  | 
 **sourceId** | **int**|  | 

### Return type

[**PipeAccesorySimpleDto**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearSearch**
> List<SearchPipeAccessory> gearSearch(search, type, page, pageSize, searchType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final String search = search_example; // String | 
final String type = type_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String searchType = searchType_example; // String | 

try {
    final response = api.gearSearch(search, type, page, pageSize, searchType);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearSearch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **String**|  | 
 **type** | **String**|  | [optional] 
 **page** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **searchType** | **String**|  | [optional] 

### Return type

[**List&lt;SearchPipeAccessory&gt;**](SearchPipeAccessory.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearSessions**
> List<SmokeSessionSimpleDto> gearSessions(id, pageSize, page)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final int id = 56; // int | 
final int pageSize = 56; // int | 
final int page = 56; // int | 

try {
    final response = api.gearSessions(id, pageSize, page);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearSessions: $e\n');
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

# **gearVote**
> Object gearVote(id, value)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getGearApi();
final int id = 56; // int | 
final int value = 56; // int | 

try {
    final response = api.gearVote(id, value);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GearApi->gearVote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **value** | **int**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

