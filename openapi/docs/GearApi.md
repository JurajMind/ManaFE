# openapi.api.GearApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**gearGetBrands**](GearApi.md#gearGetBrands) | **GET** /api/Gear/Brands | 
[**gearGetBrandsPrefix**](GearApi.md#gearGetBrandsPrefix) | **GET** /api/Gear/Brands/{prefix} | 
[**gearGetDetails**](GearApi.md#gearGetDetails) | **GET** /api/Gear/{id}/Detail | 
[**gearSearch**](GearApi.md#gearSearch) | **GET** /api/Gear/Search/{search} | 
[**gearVote**](GearApi.md#gearVote) | **POST** /api/Gear/{id}/Vote | 


# **gearGetBrands**
> InlineResponse200 gearGetBrands()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new GearApi();

try { 
    var result = api_instance.gearGetBrands();
    print(result);
} catch (e) {
    print("Exception when calling GearApi->gearGetBrands: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearGetBrandsPrefix**
> List<String> gearGetBrandsPrefix(prefix)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new GearApi();
var prefix = prefix_example; // String | 

try { 
    var result = api_instance.gearGetBrandsPrefix(prefix);
    print(result);
} catch (e) {
    print("Exception when calling GearApi->gearGetBrandsPrefix: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **String**|  | [default to null]

### Return type

**List<String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearGetDetails**
> PipeAccessoryDetailsDto gearGetDetails(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new GearApi();
var id = 56; // int | 

try { 
    var result = api_instance.gearGetDetails(id);
    print(result);
} catch (e) {
    print("Exception when calling GearApi->gearGetDetails: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**PipeAccessoryDetailsDto**](PipeAccessoryDetailsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearSearch**
> List<SearchPipeAccessory> gearSearch(search, type, page, pageSize, searchType)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new GearApi();
var search = search_example; // String | 
var type = type_example; // String | 
var page = 56; // int | 
var pageSize = 56; // int | 
var searchType = searchType_example; // String | 

try { 
    var result = api_instance.gearSearch(search, type, page, pageSize, searchType);
    print(result);
} catch (e) {
    print("Exception when calling GearApi->gearSearch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **String**|  | [default to null]
 **type** | **String**|  | [optional] [default to null]
 **page** | **int**|  | [optional] [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **searchType** | **String**|  | [optional] [default to null]

### Return type

[**List<SearchPipeAccessory>**](SearchPipeAccessory.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gearVote**
> Object gearVote(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new GearApi();
var id = 56; // int | 
var body = new int(); // int | 

try { 
    var result = api_instance.gearVote(id, body);
    print(result);
} catch (e) {
    print("Exception when calling GearApi->gearVote: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **int**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

