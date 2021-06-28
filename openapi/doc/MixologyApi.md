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

final api_instance = MixologyApi();
final newMix = TobaccoMixSimpleDto(); // TobaccoMixSimpleDto | 

try { 
    final result = api_instance.mixologyAddToMix(newMix);
    print(result);
} catch (e) {
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

final api_instance = MixologyApi();
final ids = []; // List<int> | 
final pageSize = 56; // int | 
final page = 56; // int | 
final own = true; // bool | 

try { 
    final result = api_instance.mixologyGetMiFromTobaccos(ids, pageSize, page, own);
    print(result);
} catch (e) {
    print('Exception when calling MixologyApi->mixologyGetMiFromTobaccos: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**List<int>**](int.md)|  | [default to const []]
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 
 **own** | **bool**|  | [optional] 

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

final api_instance = MixologyApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final author = author_example; // String | 
final orderBy = orderBy_example; // String | 
final order = order_example; // String | 

try { 
    final result = api_instance.mixologyGetMixes(page, pageSize, author, orderBy, order);
    print(result);
} catch (e) {
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

final api_instance = MixologyApi();
final id = 56; // int | 

try { 
    final result = api_instance.mixologyGetTobaccoMix(id);
    print(result);
} catch (e) {
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

final api_instance = MixologyApi();
final id = 56; // int | 

try { 
    final result = api_instance.mixologyGetTobaccoMixTastes(id);
    print(result);
} catch (e) {
    print('Exception when calling MixologyApi->mixologyGetTobaccoMixTastes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

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

final api_instance = MixologyApi();
final mixId = 56; // int | 

try { 
    final result = api_instance.mixologyRemoveMix(mixId);
    print(result);
} catch (e) {
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

final api_instance = MixologyApi();
final id = 56; // int | 
final newName = newName_example; // String | 

try { 
    final result = api_instance.mixologyRenameMix(id, newName);
    print(result);
} catch (e) {
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

final api_instance = MixologyApi();
final ids = []; // List<int> | 
final pageSize = 56; // int | 
final page = 56; // int | 
final own = true; // bool | 

try { 
    final result = api_instance.mixologySuggestMixTobacco(ids, pageSize, page, own);
    print(result);
} catch (e) {
    print('Exception when calling MixologyApi->mixologySuggestMixTobacco: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | [**List<int>**](int.md)|  | [default to const []]
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 
 **own** | **bool**|  | [optional] 

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

final api_instance = MixologyApi();
final id = 56; // int | 
final value = int(); // int | 

try { 
    final result = api_instance.mixologyVote(id, value);
    print(result);
} catch (e) {
    print('Exception when calling MixologyApi->mixologyVote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **value** | **int**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

