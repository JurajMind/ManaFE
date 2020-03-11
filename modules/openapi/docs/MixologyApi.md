# openapi.api.MixologyApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**mixologyAddToMix**](MixologyApi.md#mixologyAddToMix) | **POST** /api/Mixology/AddToMix | 
[**mixologyGetMiFromTobaccos**](MixologyApi.md#mixologyGetMiFromTobaccos) | **GET** /api/Mixology/Suggest/Mix | 
[**mixologyGetMixes**](MixologyApi.md#mixologyGetMixes) | **GET** /api/Mixology/GetMixes | 
[**mixologyGetTobaccoMix**](MixologyApi.md#mixologyGetTobaccoMix) | **GET** /api/Mixology/{id}/GetMix | 
[**mixologyGetTobaccoMixTastes**](MixologyApi.md#mixologyGetTobaccoMixTastes) | **GET** /api/Mixology/{id}/GetTastes | 
[**mixologyRemoveMix**](MixologyApi.md#mixologyRemoveMix) | **DELETE** /api/Mixology/RemoveMix | 
[**mixologyRenameMix**](MixologyApi.md#mixologyRenameMix) | **POST** /api/Mixology/RenameMix/{id} | 
[**mixologySuggestMixTobacco**](MixologyApi.md#mixologySuggestMixTobacco) | **GET** /api/Mixology/Suggest/Tobacco | 
[**mixologyVote**](MixologyApi.md#mixologyVote) | **POST** /api/Mixology/{id}/Vote | 


# **mixologyAddToMix**
> TobaccoMixSimpleDto mixologyAddToMix(newMix)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new MixologyApi();
var newMix = new TobaccoMixSimpleDto(); // TobaccoMixSimpleDto | 

try { 
    var result = api_instance.mixologyAddToMix(newMix);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyAddToMix: $e\n");
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

var api_instance = new MixologyApi();
var ids = []; // List<int> | 
var pageSize = 56; // int | 
var page = 56; // int | 
var own = true; // bool | 

try { 
    var result = api_instance.mixologyGetMiFromTobaccos(ids, pageSize, page, own);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyGetMiFromTobaccos: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**List&lt;int&gt;**](int.md)|  | [default to []]
 **pageSize** | **int**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]
 **own** | **bool**|  | [optional] [default to null]

### Return type

[**List<TobaccoMixSimpleDto>**](TobaccoMixSimpleDto.md)

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

var api_instance = new MixologyApi();
var page = 56; // int | 
var pageSize = 56; // int | 
var author = author_example; // String | 
var orderBy = orderBy_example; // String | 
var order = order_example; // String | 

try { 
    var result = api_instance.mixologyGetMixes(page, pageSize, author, orderBy, order);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyGetMixes: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **author** | **String**|  | [optional] [default to null]
 **orderBy** | **String**|  | [optional] [default to null]
 **order** | **String**|  | [optional] [default to null]

### Return type

[**List<TobaccoMixSimpleDto>**](TobaccoMixSimpleDto.md)

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

var api_instance = new MixologyApi();
var id = 56; // int | 

try { 
    var result = api_instance.mixologyGetTobaccoMix(id);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyGetTobaccoMix: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

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

var api_instance = new MixologyApi();
var id = 56; // int | 

try { 
    var result = api_instance.mixologyGetTobaccoMixTastes(id);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyGetTobaccoMixTastes: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**Map<String, List<TobaccoTasteDto>>**](List.md)

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

var api_instance = new MixologyApi();
var mixId = 56; // int | 

try { 
    var result = api_instance.mixologyRemoveMix(mixId);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyRemoveMix: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mixId** | **int**|  | [default to null]

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

var api_instance = new MixologyApi();
var id = 56; // int | 
var newName = newName_example; // String | 

try { 
    var result = api_instance.mixologyRenameMix(id, newName);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyRenameMix: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **newName** | **String**|  | [default to null]

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

var api_instance = new MixologyApi();
var ids = []; // List<int> | 
var pageSize = 56; // int | 
var page = 56; // int | 
var own = true; // bool | 

try { 
    var result = api_instance.mixologySuggestMixTobacco(ids, pageSize, page, own);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologySuggestMixTobacco: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**List&lt;int&gt;**](int.md)|  | [default to []]
 **pageSize** | **int**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]
 **own** | **bool**|  | [optional] [default to null]

### Return type

[**List<TobaccoSimpleDto>**](TobaccoSimpleDto.md)

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

var api_instance = new MixologyApi();
var id = 56; // int | 
var value = new int(); // int | 

try { 
    var result = api_instance.mixologyVote(id, value);
    print(result);
} catch (e) {
    print("Exception when calling MixologyApi->mixologyVote: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **value** | **int**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

