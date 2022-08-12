# openapi.api.MixologyApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**mixologyAddToMix**](MixologyApi.md#mixologyaddtomix) | **POST** /api/Mixology/AddToMix | 
[**mixologyGetMiFromTobaccos**](MixologyApi.md#mixologygetmifromtobaccos) | **GET** /api/Mixology/Suggest/Mix | 
[**mixologyGetMixes**](MixologyApi.md#mixologygetmixes) | **GET** /api/Mixology/GetMixes | 
[**mixologyGetTobaccoMix**](MixologyApi.md#mixologygettobaccomix) | **GET** /api/Mixology/{id}/GetMix | 
[**mixologyGetTobaccoMixTastes**](MixologyApi.md#mixologygettobaccomixtastes) | **GET** /api/Mixology/{id}/GetTastes | 
[**mixologyRemoveMix**](MixologyApi.md#mixologyremovemix) | **DELETE** /api/Mixology/RemoveMix | 
[**mixologyRenameMix**](MixologyApi.md#mixologyrenamemix) | **POST** /api/Mixology/RenameMix/{id} | 
[**mixologySuggestMixTobacco**](MixologyApi.md#mixologysuggestmixtobacco) | **GET** /api/Mixology/Suggest/Tobacco | 
[**mixologyVote**](MixologyApi.md#mixologyvote) | **POST** /api/Mixology/{id}/Vote | 


# **mixologyAddToMix**
> TobaccoMixSimpleDto mixologyAddToMix(newMix)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final TobaccoMixSimpleDto newMix = ; // TobaccoMixSimpleDto | 

try {
    final response = api.mixologyAddToMix(newMix);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyAddToMix: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newMix** | [**TobaccoMixSimpleDto**](TobaccoMixSimpleDto.md)|  | 

### Return type

[**TobaccoMixSimpleDto**](TobaccoMixSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologyGetMiFromTobaccos**
> List<TobaccoMixSimpleDto> mixologyGetMiFromTobaccos(ids, pageSize, page, own)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final List<int> ids = ; // List<int> | 
final int pageSize = 56; // int | 
final int page = 56; // int | 
final bool own = true; // bool | 

try {
    final response = api.mixologyGetMiFromTobaccos(ids, pageSize, page, own);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyGetMiFromTobaccos: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**List&lt;int&gt;**](int.md)|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 
 **own** | **bool**|  | [optional] 

### Return type

[**List&lt;TobaccoMixSimpleDto&gt;**](TobaccoMixSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologyGetMixes**
> List<TobaccoMixSimpleDto> mixologyGetMixes(page, pageSize, author, orderBy, order)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String author = author_example; // String | 
final String orderBy = orderBy_example; // String | 
final String order = order_example; // String | 

try {
    final response = api.mixologyGetMixes(page, pageSize, author, orderBy, order);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyGetMixes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **author** | **String**|  | [optional] 
 **orderBy** | **String**|  | [optional] 
 **order** | **String**|  | [optional] 

### Return type

[**List&lt;TobaccoMixSimpleDto&gt;**](TobaccoMixSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologyGetTobaccoMix**
> TobaccoMixSimpleDto mixologyGetTobaccoMix(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final int id = 56; // int | 

try {
    final response = api.mixologyGetTobaccoMix(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyGetTobaccoMix: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**TobaccoMixSimpleDto**](TobaccoMixSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologyGetTobaccoMixTastes**
> Map<String, List<TobaccoTasteDto>> mixologyGetTobaccoMixTastes(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final int id = 56; // int | 

try {
    final response = api.mixologyGetTobaccoMixTastes(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyGetTobaccoMixTastes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Map&lt;String, List&lt;TobaccoTasteDto&gt;&gt;**](List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologyRemoveMix**
> Dto mixologyRemoveMix(mixId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final int mixId = 56; // int | 

try {
    final response = api.mixologyRemoveMix(mixId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyRemoveMix: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mixId** | **int**|  | 

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologyRenameMix**
> TobaccoMixSimpleDto mixologyRenameMix(id, newName)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final int id = 56; // int | 
final String newName = newName_example; // String | 

try {
    final response = api.mixologyRenameMix(id, newName);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyRenameMix: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **newName** | **String**|  | 

### Return type

[**TobaccoMixSimpleDto**](TobaccoMixSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologySuggestMixTobacco**
> List<TobaccoSimpleDto> mixologySuggestMixTobacco(ids, pageSize, page, own)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final List<int> ids = ; // List<int> | 
final int pageSize = 56; // int | 
final int page = 56; // int | 
final bool own = true; // bool | 

try {
    final response = api.mixologySuggestMixTobacco(ids, pageSize, page, own);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologySuggestMixTobacco: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**List&lt;int&gt;**](int.md)|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 
 **own** | **bool**|  | [optional] 

### Return type

[**List&lt;TobaccoSimpleDto&gt;**](TobaccoSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mixologyVote**
> Object mixologyVote(id, value)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMixologyApi();
final int id = 56; // int | 
final int value = 56; // int | 

try {
    final response = api.mixologyVote(id, value);
    print(response);
} catch on DioError (e) {
    print('Exception when calling MixologyApi->mixologyVote: $e\n');
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

