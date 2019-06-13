# openapi.api.FeatureMixApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**featureMixAddFollow**](FeatureMixApi.md#featureMixAddFollow) | **POST** /api/FeatureMix/Follow/{id} | 
[**featureMixFix**](FeatureMixApi.md#featureMixFix) | **POST** /api/FeatureMix/Fix | 
[**featureMixGetFeatureMixCreator**](FeatureMixApi.md#featureMixGetFeatureMixCreator) | **GET** /api/FeatureMix/FeatureCreator/{id} | 
[**featureMixGetFeatureMixCreators**](FeatureMixApi.md#featureMixGetFeatureMixCreators) | **GET** /api/FeatureMix/FeatureCreators | 
[**featureMixGetFollowedCreators**](FeatureMixApi.md#featureMixGetFollowedCreators) | **GET** /api/FeatureMix/FollowedCreators | 
[**featureMixGetMixes**](FeatureMixApi.md#featureMixGetMixes) | **GET** /api/FeatureMix/Mixes/{id} | 
[**featureMixRemoveFollow**](FeatureMixApi.md#featureMixRemoveFollow) | **DELETE** /api/FeatureMix/Follow/{id} | 


# **featureMixAddFollow**
> featureMixAddFollow(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FeatureMixApi();
var id = 56; // int | 

try { 
    api_instance.featureMixAddFollow(id);
} catch (e) {
    print("Exception when calling FeatureMixApi->featureMixAddFollow: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

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

var api_instance = new FeatureMixApi();

try { 
    api_instance.featureMixFix();
} catch (e) {
    print("Exception when calling FeatureMixApi->featureMixFix: $e\n");
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

var api_instance = new FeatureMixApi();
var id = 56; // int | 

try { 
    var result = api_instance.featureMixGetFeatureMixCreator(id);
    print(result);
} catch (e) {
    print("Exception when calling FeatureMixApi->featureMixGetFeatureMixCreator: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**FeatureMixCreatorDto**](FeatureMixCreatorDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixGetFeatureMixCreators**
> List<FeatureMixCreatorSimpleDto> featureMixGetFeatureMixCreators(page, pageSize, orderBy, order)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FeatureMixApi();
var page = 56; // int | 
var pageSize = 56; // int | 
var orderBy = orderBy_example; // String | 
var order = order_example; // String | 

try { 
    var result = api_instance.featureMixGetFeatureMixCreators(page, pageSize, orderBy, order);
    print(result);
} catch (e) {
    print("Exception when calling FeatureMixApi->featureMixGetFeatureMixCreators: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **orderBy** | **String**|  | [optional] [default to null]
 **order** | **String**|  | [optional] [default to null]

### Return type

[**List<FeatureMixCreatorSimpleDto>**](FeatureMixCreatorSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixGetFollowedCreators**
> List<FeatureMixCreatorSimpleDto> featureMixGetFollowedCreators()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FeatureMixApi();

try { 
    var result = api_instance.featureMixGetFollowedCreators();
    print(result);
} catch (e) {
    print("Exception when calling FeatureMixApi->featureMixGetFollowedCreators: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<FeatureMixCreatorSimpleDto>**](FeatureMixCreatorSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixGetMixes**
> List<PipeAccesorySimpleDto> featureMixGetMixes(id, page, pageSize, orderBy, order)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FeatureMixApi();
var id = 56; // int | 
var page = 56; // int | 
var pageSize = 56; // int | 
var orderBy = orderBy_example; // String | 
var order = order_example; // String | 

try { 
    var result = api_instance.featureMixGetMixes(id, page, pageSize, orderBy, order);
    print(result);
} catch (e) {
    print("Exception when calling FeatureMixApi->featureMixGetMixes: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **page** | **int**|  | [default to null]
 **pageSize** | **int**|  | [default to null]
 **orderBy** | **String**|  | [default to null]
 **order** | **String**|  | [default to null]

### Return type

[**List<PipeAccesorySimpleDto>**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **featureMixRemoveFollow**
> featureMixRemoveFollow(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new FeatureMixApi();
var id = 56; // int | 

try { 
    api_instance.featureMixRemoveFollow(id);
} catch (e) {
    print("Exception when calling FeatureMixApi->featureMixRemoveFollow: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

