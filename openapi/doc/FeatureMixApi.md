# openapi.api.FeatureMixApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**featureMixAddFollow**](FeatureMixApi.md#featuremixaddfollow) | **POST** /api/FeatureMix/Follow/{id} | 
[**featureMixFix**](FeatureMixApi.md#featuremixfix) | **POST** /api/FeatureMix/Fix | 
[**featureMixGetFeatureMixCreator**](FeatureMixApi.md#featuremixgetfeaturemixcreator) | **GET** /api/FeatureMix/FeatureCreator/{id} | 
[**featureMixGetFeatureMixCreators**](FeatureMixApi.md#featuremixgetfeaturemixcreators) | **GET** /api/FeatureMix/FeatureCreators | 
[**featureMixGetFollowedCreators**](FeatureMixApi.md#featuremixgetfollowedcreators) | **GET** /api/FeatureMix/FollowedCreators | 
[**featureMixGetMixes**](FeatureMixApi.md#featuremixgetmixes) | **GET** /api/FeatureMix/Mixes/{id} | 
[**featureMixRemoveFollow**](FeatureMixApi.md#featuremixremovefollow) | **DELETE** /api/FeatureMix/Follow/{id} | 


# **featureMixAddFollow**
> featureMixAddFollow(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFeatureMixApi();
final int id = 56; // int | 

try {
    api.featureMixAddFollow(id);
} catch on DioError (e) {
    print('Exception when calling FeatureMixApi->featureMixAddFollow: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixFix**
> featureMixFix()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFeatureMixApi();

try {
    api.featureMixFix();
} catch on DioError (e) {
    print('Exception when calling FeatureMixApi->featureMixFix: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixGetFeatureMixCreator**
> FeatureMixCreatorDto featureMixGetFeatureMixCreator(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFeatureMixApi();
final int id = 56; // int | 

try {
    final response = api.featureMixGetFeatureMixCreator(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeatureMixApi->featureMixGetFeatureMixCreator: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**FeatureMixCreatorDto**](FeatureMixCreatorDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixGetFeatureMixCreators**
> List<FeatureMixCreatorSimpleDto> featureMixGetFeatureMixCreators(page, pageSize, orderBy, order)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFeatureMixApi();
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String orderBy = orderBy_example; // String | 
final String order = order_example; // String | 

try {
    final response = api.featureMixGetFeatureMixCreators(page, pageSize, orderBy, order);
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeatureMixApi->featureMixGetFeatureMixCreators: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **orderBy** | **String**|  | [optional] 
 **order** | **String**|  | [optional] 

### Return type

[**List&lt;FeatureMixCreatorSimpleDto&gt;**](FeatureMixCreatorSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixGetFollowedCreators**
> List<FeatureMixCreatorSimpleDto> featureMixGetFollowedCreators()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFeatureMixApi();

try {
    final response = api.featureMixGetFollowedCreators();
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeatureMixApi->featureMixGetFollowedCreators: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;FeatureMixCreatorSimpleDto&gt;**](FeatureMixCreatorSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixGetMixes**
> List<TobaccoMixSimpleDto> featureMixGetMixes(id, page, pageSize, orderBy, order)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFeatureMixApi();
final int id = 56; // int | 
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String orderBy = orderBy_example; // String | 
final String order = order_example; // String | 

try {
    final response = api.featureMixGetMixes(id, page, pageSize, orderBy, order);
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeatureMixApi->featureMixGetMixes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **page** | **int**|  | 
 **pageSize** | **int**|  | 
 **orderBy** | **String**|  | 
 **order** | **String**|  | 

### Return type

[**List&lt;TobaccoMixSimpleDto&gt;**](TobaccoMixSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixRemoveFollow**
> featureMixRemoveFollow(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getFeatureMixApi();
final int id = 56; // int | 

try {
    api.featureMixRemoveFollow(id);
} catch on DioError (e) {
    print('Exception when calling FeatureMixApi->featureMixRemoveFollow: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

