# openapi.api.PersonApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**personAddMyGear**](PersonApi.md#personAddMyGear) | **POST** /api/Person/MyGear/{id}/Add/{count} | 
[**personAddNotificationToken**](PersonApi.md#personAddNotificationToken) | **PUT** /api/Person/NotificationToken | 
[**personDeleteMyGear**](PersonApi.md#personDeleteMyGear) | **POST** /api/Person/MyGear/{id}/Delete | 
[**personGetPersonActiveData**](PersonApi.md#personGetPersonActiveData) | **GET** /api/Person/InitData | 
[**personGetPersonDevices**](PersonApi.md#personGetPersonDevices) | **GET** /api/Person/Devices | 
[**personGetPersonInfo**](PersonApi.md#personGetPersonInfo) | **GET** /api/Person/Info | 
[**personGetRecentAccessories**](PersonApi.md#personGetRecentAccessories) | **GET** /api/Person/MyGear/Used/{sessionCount} | 
[**personMyGear**](PersonApi.md#personMyGear) | **GET** /api/Person/MyGear | 
[**personTestNotification**](PersonApi.md#personTestNotification) | **POST** /api/Person/TestNotification | 


# **personAddMyGear**
> PipeAccesorySimpleDto personAddMyGear(id, count)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();
var id = 56; // int | 
var count = 56; // int | 

try { 
    var result = api_instance.personAddMyGear(id, count);
    print(result);
} catch (e) {
    print("Exception when calling PersonApi->personAddMyGear: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **count** | **int**|  | [default to null]

### Return type

[**PipeAccesorySimpleDto**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personAddNotificationToken**
> personAddNotificationToken(token)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();
var token = token_example; // String | 

try { 
    api_instance.personAddNotificationToken(token);
} catch (e) {
    print("Exception when calling PersonApi->personAddNotificationToken: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**|  | [default to null]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personDeleteMyGear**
> bool personDeleteMyGear(id, count)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();
var id = 56; // int | 
var count = 56; // int | 

try { 
    var result = api_instance.personDeleteMyGear(id, count);
    print(result);
} catch (e) {
    print("Exception when calling PersonApi->personDeleteMyGear: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **count** | **int**|  | [default to null]

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **personGetPersonDevices**
> List<DeviceSimpleDto> personGetPersonDevices()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();

try { 
    var result = api_instance.personGetPersonDevices();
    print(result);
} catch (e) {
    print("Exception when calling PersonApi->personGetPersonDevices: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<DeviceSimpleDto>**](DeviceSimpleDto.md)

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

# **personGetRecentAccessories**
> List<PipeAccesorySimpleDto> personGetRecentAccessories(sessionCount)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();
var sessionCount = 56; // int | 

try { 
    var result = api_instance.personGetRecentAccessories(sessionCount);
    print(result);
} catch (e) {
    print("Exception when calling PersonApi->personGetRecentAccessories: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionCount** | **int**|  | [default to null]

### Return type

[**List<PipeAccesorySimpleDto>**](PipeAccesorySimpleDto.md)

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

# **personTestNotification**
> personTestNotification()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PersonApi();

try { 
    api_instance.personTestNotification();
} catch (e) {
    print("Exception when calling PersonApi->personTestNotification: $e\n");
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

