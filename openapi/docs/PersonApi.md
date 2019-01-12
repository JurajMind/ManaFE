# openapi.api.PersonApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**personGetPersonActiveData**](PersonApi.md#personGetPersonActiveData) | **GET** /api/Person/InitData | 
[**personGetPersonInfo**](PersonApi.md#personGetPersonInfo) | **GET** /api/Person/Info | 
[**personMyGear**](PersonApi.md#personMyGear) | **GET** /api/Person/MyGear | 


# **personGetPersonActiveData**
> PersonActiveDataDto personGetPersonActiveData()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();

try { 
    var result = api_instance.personGetPersonActiveData();
    print(result);
} catch (e) {
    print("Exception when calling PersonApi->personGetPersonActiveData: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PersonActiveDataDto**](PersonActiveDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personGetPersonInfo**
> PersonInfoDto personGetPersonInfo()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();

try { 
    var result = api_instance.personGetPersonInfo();
    print(result);
} catch (e) {
    print("Exception when calling PersonApi->personGetPersonInfo: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PersonInfoDto**](PersonInfoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personMyGear**
> List<PipeAccesorySimpleDto> personMyGear(type)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();
var type = type_example; // String | 

try { 
    var result = api_instance.personMyGear(type);
    print(result);
} catch (e) {
    print("Exception when calling PersonApi->personMyGear: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | [optional] [default to null]

### Return type

[**List<PipeAccesorySimpleDto>**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

